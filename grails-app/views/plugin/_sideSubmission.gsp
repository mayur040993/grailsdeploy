<section class="aside">
    <aside id="instructions">
        <h3>Instructions</h3>
        <ul>
            <li class="instructions">
                <p>
                    Each plugin goes through an approval process to be included in the maven repository.
                    Part of the process is the involvement of the community to offer suggestions and approval.
                </p>

                <p>Please fill out the form to the right and provide a description of the plugin and it's usages.</p>
            </li>
        </ul>
    </aside>
    <aside id="links">
        <h3>Links</h3>
        <ul>
            <li>
                <a href="/plugins">
                    <g:img dir="img/icons" file="plugin.png"/>
                    Plugins
                </a>
            </li>
            <li <g:if test="${actionName == 'submitPlugin'}">class="active"</g:if>>
                <a href="/plugins/submitPlugin">
                    <g:img dir="img/icons" file="submit.png"/>
                    Submit a Plugin
                </a>
            </li>
            <li
                <g:if test="${['pendingPlugins', 'showPendingPlugin'].contains(actionName)}">class="active"</g:if>>
                <a href="/plugins/pending">
                    <g:img dir="img/icons" file="pending.png"/>
                    View Pending Plugins
                </a>
            </li>
            <li>
                <a href="/Creating+Plugins" target="_blank">
                    <g:img dir="img/icons" file="documentation.png"/>
                    Publishing Plugins Guide
                </a>
            </li>
        </ul>
    </aside>
</section>
