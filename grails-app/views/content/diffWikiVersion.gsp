<head>
    <title><g:message code="wiki.edit.title" args="${[content?.title]}"/></title>
    <meta content="masterv2" name="layout"/>
    <asset:stylesheet src="codeMirror"/>
    <asset:javascript src="codeMirror"/>
    <asset:stylesheet src="fancyBox"/>
    <asset:javascript src="fancyBox"/>
    <asset:javascript src="diff_match_patch"/>
</head>

<body>

<div id="content" class="content-aside" role="main">

    <g:render template="sideNav"/>

    <section id="main">
        <article>
            <g:render template="viewActions" model="[content: content]"/>
            
            <h2>Documentation</h2>
            <div class="alert">${message}</div>
            <div style="display:none;">
                <div id="text1">${text1}</div>
                <div id="text2">${text2}</div>    
            </div>
            <div id="diffOutputDiv">
            
            </div>

        </article>
    </section>
</div>

</body>
</html>

<asset:script type="text/javascript">

    var dmp = new diff_match_patch();


    function showDiff() {


        var text1 = $("#text1").text()
        var text2 = $("#text2").text()
        var d = dmp.diff_main(text1, text2);
        dmp.diff_cleanupSemantic(d);
        var ds = dmp.diff_prettyHtml(d);

        $('#diffOutputDiv').html(ds)

        
    }

    $(document).ready(showDiff)

</asset:script>



