<flash:message flash="${flash}" bean="${wikiPage}"/>

<g:form class="wiki-form content-form" name="wiki-form" url="[action: 'saveWikiPage', id: wikiPage?.title]"
        method="post">
    <g:hiddenField name="title" value="${wikiPage?.title}"/>
    <input type="hidden" name="version" value="${wikiPage?.version}"/>
    <fieldset>
        <div class="control-group ${hasErrors(bean: wikiPage, field: 'body', 'error')}">
          <g:textArea class="form-control wiki input-fullsize" cols="30" rows="20" id="wikiPageBody" name="body"
                      value="${wikiPage?.body}" />
        </div>

        <div class="form-group"><div class="col-sm-offset-2 col-sm-10">
            <span class="pull-right">
                <a href="/${wikiPage?.title}" class="btn">Cancel</a>
            </span>
            <g:submitButton name="submit" value="Save Changes" class="btn"/>
            <a class="btn preview">Preview</a>
        </div></div>
    </fieldset>

</g:form>
