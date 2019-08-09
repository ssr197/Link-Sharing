package newlinksharingapp

class ResourcesController {
    def resourcesService
    def dashboardService
    def resourcesRatingService
    //def userListService

    def saveDocument() {
        if (!session.name) {
            redirectToHome()
        } else {
            String email = session.name
            resourcesService.saveDocumentMethod(params, request, email)
            redirect(controller: "dashboard", action: "dashboard")
        }
    }

    def saveLink() {
        if (!session.name) {
            redirectToHome()
        } else {
            String email = session.name
            resourcesService.saveLink(params, email)
            redirect(controller: "dashboard", action: "dashboard")
        }
    }

    def downloadFile() {

        if (!session.name) {
            redirectToHome()
        } else {
            Long id = Long.parseLong(params.id)
            DocumentResource documentResource = (DocumentResource) Resources.get(id)
            def file = new File("/home/saurabh/Desktop/downloadedFromLinkSharing/a.txt")
            def temp = new File(documentResource.filePath)
            if (temp.exists()) {
                file = temp
            } else {
                file = null
            }
            response.setHeader("Content-disposition", "attachment;filename=\"${documentResource.filePath}\"")
            response.outputStream << file.bytes
        }
    }

    def index() {
        if (!session.name) {
            redirectToHome()
        } else {
            Resources res = Resources.get(params.id)
            List trending = dashboardService.trendtopics()
            List trending1 = trending.collect { it.id }
            Users user = Users.findByEmail(session.name)
            List subcount = dashboardService.subscriptioncount(trending1)
            List postcount = dashboardService.postscount(trending1)
            def rating = resourcesRatingService.readrating(session.name, res)
            render(view: "showPostAndRate", model: [resource: res, trending: trending, countforsubs: subcount, countforposts: postcount, userdata: user, value: rating])
        }
    }

    def showPostList() {
        if (!session.name) {
            redirectToHome()
        } else {
            List<Resources> listAll = resourcesService.AllPostList();
            Users u1 = Users.findByEmail(session.name)
            render(view: "postList", model: [allPostList: listAll, userdata: u1])

        }
    }

    def redirectToHome() {
        flash.message = "Login First!!!"
        redirect url: '/'
    }

}