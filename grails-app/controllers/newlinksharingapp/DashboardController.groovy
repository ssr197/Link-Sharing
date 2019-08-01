package newlinksharingapp

class DashboardController {

    def dashboardService
    def readingService


    def dashboard() {
        Users u1 = Users.findByEmail(session.name)
        Integer topicCount = dashboardService.totalTopicCount(session.name)
        Integer subsCount = dashboardService.sCount(session.name)
        List  subscriptionLt = dashboardService.subscriptions(session.name)
        List aa=subscriptionLt.collect{
            it.topic
        }
        if(!subscriptionLt)
        {
            List trending = dashboardService.trendtopics()
            Users user = Users.findByEmail(session.name)
            List topic1 = dashboardService.topTopicsPosts()
            List subs1 = dashboardService.topTopicSubs()
            List resources = readingService.displayUnread(session.name)


            render(view: "dashboard" ,model : [userdata : u1 ,
                                               user: user,
                                               count_topic : topicCount ,
                                               count_subscribe  : subsCount ,
                                               subscriptions : [],
                                               subscount:[],
                                               resourcecount:[] ,
                                               trending : trending,
                                               topic1 : topic1,
                                               subs1: subs1,
                                               resources:resources,
                                                aa:aa])
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
            List resources = readingService.displayUnread(session.name)

            println "This is resource page on dashboard controllers to check how many resources I am getting "+ resources


            render(view: "dashboard" ,model : [userdata : u1 ,
                                                user: user,
                                                count_topic : topicCount ,
                                                count_subscribe  : subsCount ,
                                                subscriptions : subscriptionLt,
                                                subscount:counts,
                                                resourcecount:resourcecount ,
                                                trending : trending,
                                                topic1 : topic1,
                                                subs1: subs1,
                                               resources:resources,
            ]
            )
        }
    }


    def forwardToUploadDocument(){
        render(view: "uploadNewDocument")
    }
    def forwardToUploadLink(){
        render(view: "uploadNewLink")
    }
    def markAsRead(){
        def a = params.id
        def b = params.email
        readingService.editreadMethod(a,b)
        redirect(action : "dashboard")
    }
    def deletePost(){
        readingService.deleteMethod(params)
        redirect(action: "dashboard")

    }

}