package newlinksharingapp

class ResourcesController {
    def resourcesService

    def saveDocument() {
        resourcesService.saveDocumentMethod(params,request,session.name)
        redirect(controller: "dashboard", action: "dashboard")
    }
}
