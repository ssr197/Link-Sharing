package newlinksharingapp

class DashboardController {

    def dashboardService


    def dashboard() {
        Users u1 = Users.findByEmail(session.name)
        Integer topicCount = dashboardService.totalTopicCount(session.name)
        Integer subsCount = dashboardService.sCount(session.name)
        List  subscriptionLt = dashboardService.subscriptions(session.name)
        if(!subscriptionLt)
        {
            List trending = dashboardService.trendtopics()
            Users user = Users.findByEmail(session.name)
            List topic1 = dashboardService.topTopicsPosts()
            List subs1 = dashboardService.topTopicSubs()

            render(view: "dashboard" ,model : [userdata : u1 ,
                                               user: user,
                                               count_topic : topicCount ,
                                               count_subscribe  : subsCount ,
                                               subscriptions : [],
                                               subscount:[],
                                               resourcecount:[] ,
                                               trending : trending,
                                               topic1 : topic1,
                                               subs1: subs1]
            )
        }
        else{
            List topicList = subscriptionLt*.topic
            List<Long> topicids = topicList.collect{it.id}
            List counts = dashboardService.subscriptioncount(topicids)
            List resourcecount = dashboardService.postscount(topicids)
            List trending = dashboardService.trendtopics()
            Users user = Users.findByEmail(session.name)
            List topic1 = dashboardService.topTopicsPosts()
            List subs1 = dashboardService.topTopicSubs()


            render(view: "dashboard" ,model : [userdata : u1 ,
                                                user: user,
                                                count_topic : topicCount ,
                                                count_subscribe  : subsCount ,
                                                subscriptions : subscriptionLt,
                                                subscount:counts,
                                                resourcecount:resourcecount ,
                                                trending : trending,
                                                topic1 : topic1,
                                                subs1: subs1]
            )
        }
    }


    def forwardToUploadDocument(){
        render(view: "uploadNewDocument")
    }
    def forwardToUploadLink(){
        render(view: "uploadNewLink")
    }

}