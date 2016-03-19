package org.grails.plugin

import org.apache.shiro.SecurityUtils
import org.grails.content.GenericApprovalResponse
import org.grails.common.ApprovalStatus

class PluginPendingApprovalController {
    def pluginService
    def genericApprovalResponseService

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [
                pluginPendingApprovalList: PluginPendingApproval.list(params),
                pluginPendingApprovalTotal: PluginPendingApproval.count()
        ]
    }

    def show() {

        def pluginPendingApproval = PluginPendingApproval.get(params.id)

        if (pluginPendingApproval) {
            [pluginPendingApproval: pluginPendingApproval]

        } else {
            redirect action: 'list'
        }
    }

    def disposition() {
        def pluginPendingApprovalInstance = PluginPendingApproval.get(params.id)

        def user = pluginPendingApprovalInstance.submittedBy

        def genericApprovalResponse = new GenericApprovalResponse(
                submittedBy: user,
                moderatedBy: request.user,
                whatType: pluginPendingApprovalInstance.class.name,
                whatId: pluginPendingApprovalInstance.id,
                responseText: params.responseText,
                status: ApprovalStatus.valueOf(params.status)
        )

        if (!genericApprovalResponse.hasErrors()
                && genericApprovalResponse.save()
                && user.addToPermissions("plugin:publish:$params.pluginName")
                .addToPermissions("plugin:edit:$params.pluginName")
                .save()
        ) {

            if (genericApprovalResponseService.linkAndfirePendingApproval(genericApprovalResponse)) {
                flash.message = "Response was submitted to ${genericApprovalResponse.submittedBy?.login} (${genericApprovalResponse.submittedBy?.email})"
            }
            else {
                flash.message = "Unable to process the request including sending the email."
            }
        }
        else {
            println genericApprovalResponse.errors?.inspect()
            flash.message = "Unable to save response."
        }
        redirect action: 'show', id: pluginPendingApprovalInstance.id
    }


}
