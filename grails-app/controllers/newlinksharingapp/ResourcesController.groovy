package newlinksharingapp

import grails.artefact.Controller

class ResourcesController {
    def resourcesService

    def saveDocument() {
        String email = session.name
        resourcesService.saveDocumentMethod(params, request, email)
        redirect(controller: "dashboard", action: "dashboard")
    }

    def saveLink() {
        String email = session.name
        resourcesService.saveLinkMethod(params, request, email)
        redirect(controller: "dashboard", action: "dashboard")
    }

    def downloadFile() {

        if (!session.name) {
            render("please login first")
        } else {
            Long id = Long.parseLong(params.id)
            println "id:" + id
            DocumentResource dr = (DocumentResource) Resources.get(id)

            //Users user = session.user
            Users user = Users.findByEmail(session.name)
            def file = new File("/home/saurabh/Desktop/downloadedFromLinkSharing/a.txt")
            def temp = new File(dr.filePath)
            if (temp.exists()) {
                file = temp
            } else {
                file = null
            }
            response.setHeader("Content-disposition", "attachment;filename=\"${dr.filePath}\"")
            response.outputStream << file.bytes
        }
    }

    def viewLink(){
        if(!session.name){
            render("Please login first")
        }
        else{



        }
    }

    def deletePost(){

    }

}
