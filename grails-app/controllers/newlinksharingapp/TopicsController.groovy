package newlinksharingapp

import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicsController {
    def dashboardService
    def topicsService

    def addTopics() {
        String email = session.name
        topicsService.addTopicMethod(params,email)
        redirect(controller: "dashboard", action: "dashboard")
    }

    def topicShow(){
        List topicList = topicsService.showListMethod()
        render(view: 'AllTopicsList', model: [topiclist: topicList])
    }

    def deleteTopics(){
        List topicList1 = topicsService.deletePost(params)
        redirect(action: "topicShow")
    }



    def viewTopics(){
        Users user=Users.findByEmail(session.name)
        Users user1 = Users.findByEmail(session.name)
        Long tid = 0.0
        Long id = Long.parseLong(params.id)
        Subscription sub = Subscription.get(id)
        List subscriptionLt = dashboardService.subscriptions(session.name)
        if(sub){
            Topics t = sub.topic
            tid = t.id
        }
        else{
            tid=id
        }
        Long subscount = Subscription.createCriteria().count {
            eq("topic.id", tid)
        }
        int postcount = Resources.createCriteria().count {
            eq('topic.id', tid)
        }
        List<Subscription> subscription = Subscription.createCriteria().list {
            eq("topic.id", tid)
        }
        List<Users> users = subscription*.user
        List<Long> userslist = users.collect { it.id }
        List subscriptioncount = topicsService.subscriptioncount(userslist)
        List postscount = topicsService.topiccount(userslist)
        List<Resources> resource = Resources.createCriteria().list {
            eq("topic.id", tid)
        }
        render(view:"ShowTopics" ,
                model : [user:user,subs:sub ,
                         subscount:subscount ,
                         postcount : postcount ,
                         subscription:subscription,
                         subscriptions : subscriptionLt,
                         subscriptioncount:subscriptioncount ,
                         postscount:postscount,
                         resources:resource,
                         userdata:user1,
                         subscriptions : subscriptionLt])
    }
}
