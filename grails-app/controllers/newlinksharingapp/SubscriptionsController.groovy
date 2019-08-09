package newlinksharingapp

class SubscriptionsController {
    def subscriptionService

    def updateSerious() {
        if (!session.name) {
            redirectToHome()
        } else {
            subscriptionService.seriousness(params)
            redirect(controller: "dashboard", action: "dashboard")
        }
    }

    def updateVisibility() {
        if (!session.name) {
            redirectToHome()
        } else {
            subscriptionService.visibility(params)
            redirect(controller: "dashboard", action: "dashboard")
        }
    }

    def unsubscribe(params) {
        if (!session.name) {
            redirectToHome()
        } else {
            Long sid = 0.0
            Users user = Users.findByEmail(session.name)
            Subscription subscription = Subscription.findById(params.id)
            if (subscription) {
                sid = Long.parseLong(params.id)
            } else {
                Long topid = Long.parseLong(params.id)
                Subscription getSubcriptionId = Subscription.createCriteria().get {
                    eq('topic.id', topid)
                    eq('user.id', user.id)
                }
                sid = getSubcriptionId.id
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

    /*def unsubscribe(params) {
        if (!session.name) {
            redirectToHome()
        } else {
            Long subscriptionId = 0.0
            Users user = Users.findByEmail(session.name)
            Subscription subscription = Subscription.findById(params.id)
            if (subscription) {
                subscriptionId = Long.parseLong(params.id)
            } else {
                subscriptionId = getSubcription(params, user, subscriptionId)
            }
            Subscription s = Subscription.findById(subscriptionId)
            s.delete(flush: true)
            if (params.page == "dashboard") {
                redirect(controller: "dashboard", action: "dashboard")
            } else if (params.page == "topic") {
                redirect(controller: "Topics", action: "topicshow", params: [id: params.id])
            }
        }
    }

    long getSubcription(params, user, long subscriptionId) {
        Long topid = Long.parseLong(params.id)
        Subscription getSubcriptionId = Subscription.createCriteria().get {
            eq('topic.id', topid)
            eq('user.id', user.id)
        }
        subscriptionId = getSubcriptionId.id
        subscriptionId
    }*/


    def subscribe(params) {
        if (!session.name) {
            redirectToHome()
        } else {
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

    def sendSubscrioptionInvite() {
        if (!session.name) {
            redirectToHome()
        } else {
            Long topid = Long.parseLong(params.id)
            Users user = Users.findByEmail(params.email)
            Topics topic = Topics.get(topid)
            Subscription sub = Subscription.findByTopicAndUser(topic, user)

            if (session.name != user.email) {
                flash.message = "Login as ${user.firstName}"
                redirect(url: '/')
                session.invalidate()
            } else {
                if (sub == null) {
                    Subscription sub1 = new Subscription(seriousness: "CASUAL")
                    topic.addToSubscribedTo(sub1)
                    user.addToSubscribedTo(sub1)
                    topic.save(flush: true)
                    user.save(flush: true, failOnError: true)
                    sub1.save(flush: true, failOnError: true)
                    flash.message2 = "Subscribed successfully"
                    redirect(controller: 'dashboard', action: 'dashboard')
                } else {
                    flash.message2 = "You are already subscribed to this topic !!!"
                    redirect(controller: 'dashboard', action: 'dashboard')
                }
            }
        }
    }

    def redirectToHome() {
        flash.message = "Login First!!!"
        redirect url: '/'
    }
}
