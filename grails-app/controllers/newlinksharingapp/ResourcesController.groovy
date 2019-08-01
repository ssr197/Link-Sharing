package newlinksharingapp

import grails.artefact.Controller

class ResourcesController {
    def resourcesService
    def dashboardService

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

    def deletePost() {
    }


    def index() {
        if (!session.name) {
            render("Login reqired")
        } else {
            Resources res = Resources.get(params.id)
            List trending = dashboardService.trendtopics()
            List trending1 = trending.collect { it.id }
            Users user = Users.findByEmail(session.name)
            List subcount = dashboardService.subscriptioncount(trending1)
            List postcount = dashboardService.postscount(trending1)
            render(view: "showPostAndRate", model: [resource: res, trending: trending, countforsubs: subcount, countforposts: postcount, userdata:user])
        }
    }
}