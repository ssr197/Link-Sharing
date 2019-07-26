package newlinksharingapp

import grails.transaction.Transactional

import javax.jws.soap.SOAPBinding

@Transactional

class DashboardService {

    def totalTopicCount(String name) {
        Users findIt = Users.findByEmail(name)
        Integer TotalTopicCountAsSum = findIt.topic.size()
        return TotalTopicCountAsSum
    }

    def subscriptionCount(String name) {
        Users numberOfSubscription = Users.findByEmail(name)
        Integer TotalSubscriptionCountAsSum = numberOfSubscription.subscribedTo.size()
        return TotalSubscriptionCountAsSum
    }


}