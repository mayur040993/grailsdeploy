package org.grails.wiki

import java.util.concurrent.ConcurrentLinkedQueue

import javax.persistence.OptimisticLockException

import grails.plugin.cache.Cacheable
import grails.plugin.cache.CacheEvict
import grails.transaction.NotTransactional;
import grails.transaction.Transactional;

import org.grails.auth.User
import org.grails.content.Content
import org.grails.content.Version
import org.grails.plugin.Plugin
import org.grails.plugin.PluginTab
/*
 * author: Matthew Taylor
 */
@Transactional
class WikiPageService {
    def cacheService
    def searchableService
    def wikiPageUpdates = new ConcurrentLinkedQueue<WikiPageUpdateEvent>()
    
    @Cacheable(value="content", key="#title")
    @NotTransactional
    def getCachedOrReal(String title) {
        return Content.findAllByTitle(title).find { !it.instanceOf(Version) }
    }

    @NotTransactional
    def pageChanged(id) {
        id = id.decodeURL()
        cacheService.removeContent(id)
    }
    
    @CacheEvict(value="content", key="#title")
    WikiPage createOrUpdateWikiPage(String title, String body, User user, Long version = null) {
        def page = WikiPage.findByTitle(title)
        if (page) {
            return updateContent(page, body, user, version)
        }
        else {
            page = new WikiPage(title: title, body: body)
            return createContent(page, user)
        }
    }
    
    @CacheEvict(value="content", key="#title")
    PluginTab createOrUpdatePluginTab(String title, String body, User user, Long version = null) {
        try {
            searchableService.stopMirroring()
            
            def page = PluginTab.findByTitle(title)
            if (page) {
                updateContent(page, body, user, version)
            }
            else {
                page = new PluginTab(title: title, body: body)
                createContent(page, user)
            }

            // Mirroring does not automatically reindex the associated plugin
            // because there is no proper back reference. Also, the plugin may
            // not have been saved yet, hence why we do a null-safe call.
            page.plugin?.reindex()
            
            return page
        }
        finally {
            searchableService.startMirroring()
        }
    }
    
    protected def createContent(Content content, User user) {
        if (content.locked == null) content.locked = false
        content.save(flush:true)
        if (!content.hasErrors()) {
            Version v = content.createVersion()
            v.author = user
            v.save(failOnError: true)
            
            wikiPageUpdates << new WikiPageUpdateEvent(this, content.title, content.getClass().name)
        }
        
        return content
    }
    
    protected def updateContent(Content content, String body, User user, Long version) {
        if (content.version != version) {
            throw new OptimisticLockException("Content [${content.class.simpleName}:${content.id}] was updated by someone else. Version mismatch: Submitted version ($version), Content version (${content.version}).")
        }
        else if (content.body != body) {
            content.body = body
            content.lock()
            content.version = content.version + 1
            content.save(flush: true, failOnError: true)

            if (!content.hasErrors()) {
                Version v = content.createVersion()
                v.author = user                 
                v.save(failOnError: true)

                wikiPageUpdates << new WikiPageUpdateEvent(this, content.title, content.getClass().name)
                
                evictFromCache(content.id, content.title)
            }
        }
        
        return content
    }

    def Version latestVersion(Content content) {

    }

    private evictFromCache(id, title) {
        cacheService.removeWikiText(title)
        cacheService.removeContent(title)
        
        if (id) cacheService.removeCachedText('versionList' + id)
    }
}
