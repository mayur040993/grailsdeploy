<head>
    <meta content="masterv2" name="layout"/>
    <title>Web Sites Using Grails</title>
</head>

<body>

    <div class="content-title">
        <h1>Sites using Grails</h1>
        <g:render template="/common/searchBar" model="[type:'website']" />
    </div>

    <section id="main" class="websites">
        <div class="alert alert-block margin-bottom-15">
            <p>
                <g:message code="website.list.submit.description" />
                <g:link action="create"><g:message code="website.list.submit.button" /></g:link>.
            </p>
        </div>

        <flash:message flash="${flash}" />
        <g:render template="webSite" collection="${featuredWebSiteInstanceList}" var="webSiteInstance"/>
        <g:render template="webSite" collection="${webSiteInstanceList}" var="webSiteInstance"/>


        <div class="pager">
            <g:if test="${websiteCount}">
                <g:paginate total="${websiteCount}" max="12" />
            </g:if>
        </div>
  
    </section>

</body>
