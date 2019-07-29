package newlinksharingapp

import grails.artefact.Controller

class ResourcesController {
    def resourcesService

    def saveDocument() {
        String email = session.name
        resourcesService.saveDocumentMethod(params,request, email)
        redirect(controller: "dashboard", action: "dashboard")
    }

    def saveLink(){
        String email = session.name
        resourcesService.saveLinkMethod(params, request, email)
        //render("Wow, You are done with uploading link")
        redirect(controller: "dashboard", action: "dashboard")
    }

}
