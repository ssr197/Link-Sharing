package newlinksharingapp

class DashboardController {

    def dashboardService
    def readingService


    def dashboard() {
        if(!session.name){
            render("Please Login First")
        }else {
            Users u1 = Users.findByEmail(session.name)
            Integer topicCount = dashboardService.totalTopicCount(session.name)
            Integer subsCount = dashboardService.sCount(session.name)
            List subscriptionLt = dashboardService.subscriptions(session.name)
            List resources = readingService.displayUnread(session.name)
            if (!subscriptionLt) {
                List trending = dashboardService.trendtopics()
                Users user = Users.findByEmail(session.name)
                List topic1 = dashboardService.topTopicsPosts()
                List subs1 = dashboardService.topTopicSubs()
                render(view: "dashboard", model: [userdata       : u1,
                                                  user           : user,
                                                  count_topic    : topicCount,
                                                  count_subscribe: subsCount,
                                                  subscriptions  : [],
                                                  subscount      : [],
                                                  resourcecount  : [],
                                                  trending       : trending,
                                                  topic1         : topic1,
                                                  subs1          : subs1,
                                                  resources      : resources])
            } else {
                List topicList = subscriptionLt*.topic
                List<Long> topicids = topicList.collect { it.id }
                List counts = dashboardService.subscriptioncount(topicids)
                List resourcecount = dashboardService.postscount(topicids)
                List trending = dashboardService.trendtopics()
                Users user = Users.findByEmail(session.name)
                List topic1 = dashboardService.topTopicsPosts()
                List subs1 = dashboardService.topTopicSubs()
                render(view: "dashboard", model: [userdata       : u1,
                                                  user           : user,
                                                  count_topic    : topicCount,
                                                  count_subscribe: subsCount,
                                                  subscriptions  : subscriptionLt,
                                                  subscount      : counts,
                                                  resourcecount  : resourcecount,
                                                  trending       : trending,
                                                  topic1         : topic1,
                                                  subs1          : subs1,
                                                  resources      : resources,])
            }
        }
    }


    def forwardToUploadDocument(){
        if(!session.name){
            render("Please Login First")
        }else {
            render(view: "uploadNewDocument")
        }
    }
    def forwardToUploadLink(){
        if(!session.name){
            render("Please Login First")
        }else {
            render(view: "uploadNewLink")
        }
    }
    def markAsRead(params){
            readingService.editreadMethod(params.identifier, params.email)
            redirect(action: "dashboard")
    }
    def deletePost(){
        if(!session.name){
            render("Please Login First")
        }else {
            readingService.deleteMethod(params)
            redirect(action: "dashboard")
        }
    }
}