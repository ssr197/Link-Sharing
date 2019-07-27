package newlinksharingapp

class DashboardController {

    def dashboardService


    def dashboard() {
        Users u1 = Users.findByEmail(session.name)
        Integer topicCount = dashboardService.totalTopicCount(session.name)
        //println "The total number of topic are for user 1 = " + topicCount
        Integer subsCount = dashboardService.sCount(session.name)
//      ---------------------------------------------------------------------------
/*

        List  subscriptionLt = dashboardService.subscriptions(session.name)
        List topicList = subscriptionLt*.topic
        List<Long> topicids = topicList.collect{it.id}
        List counts = dashboardService.subscriptioncount(topicids)
        List resourcecount = dashboardService.postscount(topicids)
        List trending = dashboardService.trendtopics()

        Users user = Users.findByUsername(session.name)


*/




//      ---------------------------------------------------------------------------
        render(view: "dashboard", model: [  userdata : u1, topicCount : topicCount, sessionCountNumber:subsCount])
    }

    def forwardToUploadDocument(){
        render(view: "uploadNewDocument")
    }
    def forwardToUploadLink(){
        render(view: "uploadNewLink")
    }

}