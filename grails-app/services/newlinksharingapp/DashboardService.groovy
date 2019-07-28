package newlinksharingapp

import grails.transaction.Transactional

import javax.jws.soap.SOAPBinding

@Transactional

class DashboardService {

    def totalTopicCount(String name) {
        Users u2 = Users.findByEmail(name)
        Integer Total = u2.topic.size()
        return Total
    }

    def sCount(String name) {
        Users numberOfSubscription = Users.findByEmail(name)
        Integer TotalSubscriptionCountAsSum = numberOfSubscription.subscribedTo.size()
        return TotalSubscriptionCountAsSum
    }
    def subscriptions(String name) {

        Users user = Users.findByEmail(name)
        List<Long> subscriptionList = Subscription.createCriteria().list{
            eq("user.id",user.id)
        }
        subscriptionList.sort{b,a-> a.topic.lastUpdated<=>b.topic.lastUpdated}
        return subscriptionList

    }

    def subscriptioncount(List topicids) {

        def topiccounts = Subscription.createCriteria().list()
                {
                    projections{
                        count('topic.id')
                        groupProperty('topic.id')
                    }
                    'topic'{
                        inList('id',topicids)
                    }
                }
        List <Integer> counts = topicids.collect{ x ->
            topiccounts.find{
                if (it.getAt(1)==x)
                    return it.getAt(0)
            }
        }.collect{it.getAt(0)}
        return counts
    }

    def postscount(List topicids) {

        def rescounts = Resources.createCriteria().list()
                {
                    projections{
                        count('topic.id')
                        groupProperty('topic.id')
                        // countDistinct('topic.id')
                    }
                    'topic'{
                        inList('id',topicids)
                    }
                }
        List <Integer> resourcecount=topicids.collect{ x ->
            rescounts.find{
                if (it.getAt(1)==x)
                    return it.getAt(0)
            }
        }.collect{if(!it)
            return 0
        else
            it.getAt(0)}
        return resourcecount
    }

    def trendtopics(){

        List <Long> topicsid = Topics.list().collect{
            it.id
        }
        List abcd = Resources.createCriteria().list(max:5)
                {
                    projections{
                        count('topic.id')
                        groupProperty('topic.id')
                    }
                }

        abcd.sort{b,a-> a.getAt(0)<=>b.getAt(0)}
        List <Integer> xyz = topicsid.collect{ x ->
            abcd.find{
                if (it.getAt(1)==x)
                    return it.getAt(0)
                else
                    return 0
            }
        }.collect{if(!it)
            return 0
        else
            it.getAt(1)}
        xyz.removeAll{it==0}
        List bbb= xyz+(topicsid-xyz)
        List <Topics> topicstrendy = Topics.createCriteria().list{
            inList('id' , bbb)
        }
        return topicstrendy
    }
}