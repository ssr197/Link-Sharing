package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def seriousness(params) {
        Subscription subscription = Subscription.get(params.id)
        subscription.seriousness = params.seriousness
    }

    def visibility(params) {
        Topics topic = Topics.get(params.id1)
        topic.visibility = params.visibility

    }
}