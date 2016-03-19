
<%@ page import="org.grails.community.Testimonial" %>
<html>
<head>
    <meta name="layout" content="masterv2"/>
    <g:set var="entityName" value="${message(code: 'testimonial.label', default: 'Testimonial')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

    <section id="main">

    <flash:message flash="${flash}" />

    <h1 class="page-header">${testimonialInstance?.title}
            <shiro:hasPermission permission="${"testimonial:edit:${testimonialInstance.id}"}">
                <span class="pull-right">
                    <g:form controller="testimonial" action="edit">
                        <g:hiddenField name="id" value="${testimonialInstance?.id}"/>

                        <button type="submit" class="btn btn-info">
                            ${message(code: 'default.button.edit.label', default: 'Edit')}
                        </button>
                    </g:form>
                </span>
            </shiro:hasPermission>
        </h1>


    <g:if test="${testimonialInstance?.companyName}">
        <h2>${testimonialInstance?.companyName}</h2>
    </g:if>


        <wiki:text>
            ${testimonialInstance?.body}
        </wiki:text>



            </section>


</body>
</html>
