package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def seriousness(params) {
        Subscription s = Subscription.get(params.id)
        s.seriousness = params.seriousness
    }
    def visibility(params){
        Topics t = Topics.get(params.id1)
        t.visibility = params.visibility

    }
}