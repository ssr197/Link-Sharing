package newlinksharingapp

class DashboardController {
    def dashboardService
    def readingService

    def dashboard() {
        if (!session.name) {
            redirectToHome()
        } else {
            Users u1 = Users.findByEmail(session.name)
            Integer topicCount = dashboardService.totalTopicCount(session.name)
            Integer subsCount = dashboardService.sCount(session.name)
            List subscriptionLt = dashboardService.subscriptions(session.name)
            List resources = readingService.displayUnread(session.name)
            List trending = dashboardService.trendtopics()
            if (!subscriptionLt) {
                render(view: "dashboard", model: [userdata: u1, count_topic: topicCount, count_subscribe: subsCount, subscriptions: [], subscount: [], resourcecount: [], trending: trending, resources: resources])
            } else {
                List topicList = subscriptionLt*.topic
                List<Long> topicids = topicList.collect { it.id }
                List counts = dashboardService.subscriptioncount(topicids)
                List resourcecount = dashboardService.postscount(topicids)
                render(view: "dashboard", model: [userdata: u1, count_topic: topicCount, count_subscribe: subsCount, subscriptions: subscriptionLt, subscount: counts, resourcecount: resourcecount, trending: trending, resources: resources,])
            }
        }
    }


    def forwardToUploadDocument() {
        if (!session.name) {
            redirectToHome()
        } else {
            render(view: "uploadNewDocument")
        }
    }

    def forwardToUploadLink() {
        if (!session.name) {
            redirectToHome()
        } else {
            render(view: "uploadNewLink")
        }
    }

    def markAsRead(params) {
        readingService.editReadMethod(params.identifier, params.email)
        redirect(action: "dashboard")
    }

    def deletePost() {
        if (!session.name) {
            redirectToHome()
        } else {
            readingService.deleteMethod(params)
            redirect(action: "dashboard")
        }
    }

    void redirectToHome() {
        flash.message = "Login First!!!"
        redirect url: '/'
    }
}