<%@ page import="org.grails.community.Testimonial" %>
<html>
<head>
    <meta name="layout" content="masterv2"/>
    <g:set var="entityName" value="${message(code: 'testimonial.label', default: 'Testimonial')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <asset:stylesheet src="codeMirror.css"/>
    <asset:stylesheet src="fancyBox.css"/>
    <asset:javascript src="fancyBox.js"/>
    <asset:javascript src="imageUpload.js"/>
    <asset:javascript src="wikiEditor.js"/>
</head>

<body>

<flash:message flash="${flash}" bean="${testimonialInstance}" />

<g:hasErrors bean="${testimonialInstance}">
    <div class="alert alert-error">
        <g:renderErrors bean="${testimonialInstance}" as="list"/>
    </div>
</g:hasErrors>


    <section id="main">
        <article>
            <h2>Add a Testimonial</h2>



            <g:form action="save" class="form-horizontal" >
            <fieldset>
               <g:render template="form" model="model" />

                <div class="form-group"><div class="col-sm-offset-2 col-sm-10">
                    <g:submitButton name="create" class="btn btn-primary"
                                    value="Submit for Approval"/>

                <a class="btn preview">Preview</a>


            </div></div>
            </fieldset>
            </g:form>

        </article>
    </section>




</body>
</html>
