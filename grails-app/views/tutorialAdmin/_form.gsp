<div class="control-group">
    <label class="col-sm-2 control-label">Submitter</label>

    <div class="col-sm-10">
        <label class="checkbox" style="padding-left: 0px;">
            <g:link controller="user" action="show" id="${tutorialInstance?.submittedBy?.id}">
                <avatar:gravatar email="${tutorialInstance?.submittedBy?.email}"
                                 size="16"/> ${tutorialInstance?.submittedBy?.email}
            </g:link>
        </label>
    </div>
</div>

<g:if test="${!tutorialInstance.id}">
    <div class="control-group">
        <label class="col-sm-2 control-label" for="title">Auto Approve?</label>

        <div class="col-sm-10">
            <label class="checkbox" for="autoApprove">
                <g:checkBox name="autoApprove"/>
                Check this box if you want the website to appear immediately on the websites page.
            </label>
        </div>
    </div>
</g:if>

<div class="control-group ${hasErrors(bean: tutorialInstance, field: 'title', 'error')}">
    <label class="col-sm-2 control-label" for="title">Title</label>

    <div class="col-sm-10">
        <g:textField class="form-control input-xxlarge" name="title" value="${tutorialInstance?.title}" />
    </div>
</div>

<div class="control-group ${hasErrors(bean: tutorialInstance, field: 'description', 'error')}">
    <label class="col-sm-2 control-label" for="description">Description</label>

    <div class="col-sm-10">
        <g:textArea class="form-control input-xxlarge" cols="30" rows="5" name="description" value="${tutorialInstance?.description}"
                    />
    </div>
</div>

<div class="control-group ${hasErrors(bean: tutorialInstance, field: 'url', 'error')}">
    <label class="col-sm-2 control-label" for="url">URL</label>

    <div class="col-sm-10">
        <g:textField class="form-control input-xxlarge" name="url" value="${tutorialInstance?.url}" />
    </div>
</div>

<div class="control-group ${hasErrors(bean: tutorialInstance, field: 'tags', 'error')}">
    <label class="col-sm-2 control-label" for="tags">Tags</label>

    <div class="col-sm-10">
        <g:textField class="form-control input-xxlarge" name="tags" value="${tutorialInstance?.tags?.join(', ')}" />
        <div class="hint">Examples: introduction, security, screencast</div>
    </div>
</div>
