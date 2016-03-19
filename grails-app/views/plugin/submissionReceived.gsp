<head>
    <meta content="masterv2" name="layout"/>
    <title>Grails Plugin Submitted for Approval</title>
    <asset:stylesheet src="plugin"/>
    <asset:javascript src="plugin"/>
</head>

<body>

<div id="content" class="content-aside-2" role="main">

    <div class="aside">
        <g:render template="sideSubmission" />
    </div>

    <section id="main">

        <article>
            <h3>Submit Plugin for Approval</h3>

            <g:if test="${flash.message}">
                <div class="alert alert-info">${flash.message}</div>
            </g:if>

            <p>Thank you for submitting your plugin. We will get back to you within 24 hours with either an approval, or
            a rejection with an explanation.</p>

        </article>
    </section>

</div>

</body>
