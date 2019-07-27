package newlinksharingapp

class DashboardController {

    def dashboardService


    def dashboard() {
        Users u1 = Users.findByEmail(session.name)
        Integer topicCount = dashboardService.totalTopicCount(session.name)
        //println "The total number of topic are for user 1 = " + topicCount
        Integer subsCount = dashboardService.sCount(session.name)

        List  subscriptionLt = dashboardService.subscriptions(session.name)
        List topicList = subscriptionLt*.topic
        List<Long> topicids = topicList.collect{it.id}
        List counts = dashboardService.subscriptioncount(topicids)
        List resourcecount = dashboardService.postscount(topicids)
        List trending = dashboardService.trendtopics()
        Users user = Users.findByEmail(session.name)

/*
        render(view: "dashboard" ,model : [userdata : u1 ,
                                            user: user,
                                            count_topic : topicCount ,
                                            count_subscribe  : subsCount ,
                                            subscriptions : subscriptionLt,
                                            subscount:counts,
                                            resourcecount:resourcecount ,
                                            trending : trending])


*/
        println "This is user u1 "+ u1
        println "This is user user "+ user
        println "This is user topicCount "+ topicCount
        println "This is user SubscriptionLt "+ subscriptionLt
        println "This is user Subscounts "+ counts
        println "This is user resourcecount"+ resourcecount
        println "This is user trending "+ trending


 //       render(view: "dashboard", model: [  userdata : u1, topicCount : topicCount, sessionCountNumber:subsCount])
    }


    def forwardToUploadDocument(){
        render(view: "uploadNewDocument")
    }
    def forwardToUploadLink(){
        render(view: "uploadNewLink")
    }

}