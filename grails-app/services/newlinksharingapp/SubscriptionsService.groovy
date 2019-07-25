package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class SubscriptionsService {

    def subscriptionsMethod() {
        Subscription s = Subscription.get(params.id)
        s.seriousness = params.seriousness;
    }
}
