package newlinksharingapp

class SubscriptionsController {
    def subscriptionService

    def updateSerious() {
        if(!session.name){
            render("Please Login First")
        }else {
            subscriptionService.seriousness(params)
            redirect(controller: "dashboard", action: "dashboard")
        }
    }
    def updateVisibility(){
        if(!session.name){
            render("Please Login First")
        }else {
            subscriptionService.visibility(params)
            redirect(controller: "dashboard", action: "dashboard")
        }
    }

    def unsubscribe(params){
        if(!session.name){
            render("Please Login First")
        }else {
            Long sid = 0.0
            Users user = Users.findByEmail(session.name)
            Subscription su = Subscription.findById(params.id)
            if (su) {
                sid = Long.parseLong(params.id)
            } else {
                Long topid = Long.parseLong(params.id)
                Subscription sub = Subscription.createCriteria().get {
                    eq('topic.id', topid)
                    eq('user.id', user.id)
                }
                sid = sub.id
            }
            Subscription s = Subscription.findById(sid)
            s.delete(flush: true)
            if (params.page == "dashboard") {
                redirect(controller: "dashboard", action: "dashboard")
            } else if (params.page == "topic") {
                redirect(controller: "Topics", action: "topicshow", params: [id: params.id])
            }
        }
    }

    def subscribe(params){
        if(!session.name){
            render("Please Login First")
        }else {
            Users user = Users.findByEmail(session.name)
            Long topid = Long.parseLong(params.id)
            Topics t = Topics.get(topid)
            Subscription s = new Subscription(seriousness: Seriousness.CASUAL, topic: t)
            user.addToSubscribedTo(s)
            s.save(flush: true, failOnError: true)
            user.save(flush: true, failOnError: true)
            redirect(controller: "dashboard", action: "dashboard")
        }
    }

    /*def sendSubscrioptionInvite(){
            Long topid = Long.parseLong(params.id)
            Users user = Users.findByEmail(params.email)
            Topics topic = Topics.get(topid)
            Subscription sub = Subscription.findByTopicAndUser(topic,user)

            if(sub==null) {
                Subscription  sub1 = new Subscription(seriousness: "CASUAL")
                topic.addToSubscribedTo(sub1)
                user.addToSubscribedTo(sub1)
                topic.save(flush:true)
                user.save(flush: true, failOnError: true)
                sub1.save(flush: true, failOnError: true)
                println "The is fully executed!!!"
            } else {
                render(text: "You have subscribed to this already")
//                flash.message6 = "Already subscribed"
            }


        if(session.name == user.email){
            println "Super"
                redirect controller: 'dashboard',action: 'dashboard'
            } else {
                render text: "You are not logged in, Login And try again!"
                *//*
                flash.message4 = "Please login first"
                session.invalidate()
                redirect url:'/*//*
            }









            *//*Users user = Users.findByEmail(params.email)
            Long topid = Long.parseLong(params.id)
            Topics t = Topics.get(topid)
            Subscription s = new Subscription(seriousness: Seriousness.CASUAL, topic: t)
            user.addToSubscribedTo(s)
            s.save(flush: true, failOnError: true)
            user.save(flush: true, failOnError: true)
            redirect(controller: "dashboard", action: "dashboard")*//*
    }*/

    def sendSubscrioptionInvite(){
        Long topid = Long.parseLong(params.id)
        Users user = Users.findByEmail(params.email)
        Topics topic = Topics.get(topid)
        Subscription sub = Subscription.findByTopicAndUser(topic,user)

        if(sub==null) {
            Subscription  sub1 = new Subscription(seriousness: "CASUAL")
            topic.addToSubscribedTo(sub1)
            user.addToSubscribedTo(sub1)
            topic.save(flush:true)
            user.save(flush: true, failOnError: true)
            sub1.save(flush: true, failOnError: true)
            println "The is fully executed!!!"
        } else {
            render(text: "You have subscribed to this already")
//                flash.message6 = "Already subscribed"
        }


        if(session.name == user.email){
            println "Super"
            redirect controller: 'dashboard',action: 'dashboard'
        } else {
            render text: "You are not logged in, Login And try again!"
            /*
            flash.message4 = "Please login first"
            session.invalidate()
            redirect url:'/*/
        }
    }
}
