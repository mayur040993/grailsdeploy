<head>
    <meta content="masterv2" name="layout"/>
    <title>Pending Grails Plugins</title>
    <asset:stylesheet src="plugin"/>
    <asset:javascript src="plugin"/>
</head>

<body>

<div id="content" class="content-aside" role="main">

    <div class="aside">
        <g:render template="sideSubmission"/>
    </div>

    <section id="main" class="items">
        <g:if test="${pluginPendingApprovalTotal == 0}">
            <div class="alert alert-block">
                <p><strong>Woot!</strong><br />
                We must really be on top of things if we have no pending plugin approvals.<br />
                    To submit your plugin for approval, go to the <a href="/plugins/submitPlugin">Submit a Plugin</a> page.</p>
            </div>
        </g:if>
        <g:render template="pendingPlugin" collection="${pluginPendingApprovalList}"
                  var="pluginPendingApprovalInstance"/>
    </section>

</div>

</body>
