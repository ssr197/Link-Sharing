package newlinksharingapp

import grails.artefact.Controller

class ResourcesController {
    def resourcesService
    def dashboardService
    def resourcesRatingService

    def saveDocument() {
        if(!session.name){
            flash.message = "Login First!!!"
            redirect url:'/'
        }else {
            String email = session.name
            resourcesService.saveDocumentMethod(params, request, email)
            redirect(controller: "dashboard", action: "dashboard")
        }
    }

    def saveLink() {
        if(!session.name){
            flash.message = "Login First!!!"
            redirect url:'/'
        }else {
            String email = session.name
            resourcesService.saveLinkMethod(params, request, email)
            redirect(controller: "dashboard", action: "dashboard")
        }
    }

    def downloadFile() {

        if (!session.name) {
            flash.message = "Login First!!!"
            redirect url:'/'
        } else {
            Long id = Long.parseLong(params.id)
            println "id:" + id
            DocumentResource dr = (DocumentResource) Resources.get(id)

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

    def index() {
        if(!session.name){
            flash.message = "Login First!!!"
            redirect url:'/'
        }else{
            Resources res = Resources.get(params.id)
            List trending = dashboardService.trendtopics()
            List trending1 = trending.collect { it.id }
            Users user = Users.findByEmail(session.name)
            List subcount = dashboardService.subscriptioncount(trending1)
            List postcount = dashboardService.postscount(trending1)
            def rating = resourcesRatingService.readrating(session.name, res)
            render(view: "showPostAndRate", model: [resource: res, trending: trending, countforsubs: subcount, countforposts: postcount, userdata:user, value: rating])
        }
    }
}