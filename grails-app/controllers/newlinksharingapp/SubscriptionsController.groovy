package newlinksharingapp

class SubscriptionsController {
    def subscriptionService

    def updateSerious() {
        subscriptionService.seriousness(params)
        redirect(controller: "dashboard", action: "dashboard")

    }
    def updateVisibility(){
        subscriptionService.visibility(params)
        redirect(controller: "dashboard", action: "dashboard")
    }

    def unsubscribe(params){
        Long sid = 0.0
        Users user=Users.findByEmail(session.name)
        Subscription su = Subscription.findById(params.id)
        if(su) {
            sid = Long.parseLong(params.id)
        }
        else
        {
            Long topid = Long.parseLong(params.id)
            Subscription sub = Subscription.createCriteria().get {
                eq('topic.id', topid)
                eq('user.id', user.id)
            }
            sid = sub.id
        }
        Subscription s = Subscription.findById(sid)
        s.delete(flush:true)
        if(params.page=="dashboard"){
            redirect(controller: "dashboard", action: "dashboard")
        }
        else if(params.page=="topic"){
            redirect(controller:"Topics" ,action:"topicshow",params:[id:params.id])
        }
    }


    def subscribe(params){
        Users user = Users.findByEmail(session.name)
        Long topid = Long.parseLong(params.id)
        Topics t = Topics.get(topid)
        Subscription s = new Subscription(seriousness: Seriousness.CASUAL ,topic:t)
        user.addToSubscribedTo(s)
        s.save(flush:true,failOnError:true)
        user.save(flush:true,failOnError:true)
        redirect(controller:"dashboard" ,action:"dashboard")
    }
}
