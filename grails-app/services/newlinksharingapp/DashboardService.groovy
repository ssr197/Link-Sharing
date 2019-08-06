package newlinksharingapp

import grails.transaction.Transactional

import javax.jws.soap.SOAPBinding

@Transactional

class DashboardService {

    def totalTopicCount(String name) {
        Integer Total = Users.findByEmail(name).topic.size()
        return Total
    }

    def sCount(String name) {
        Integer TotalSubscriptionCountAsSum = Users.findByEmail(name).subscribedTo.size()
        return TotalSubscriptionCountAsSum
    }

    def subscriptions(String name) {
        Users user = Users.findByEmail(name)
        List<Long> subscriptionList = Subscription.createCriteria().list{
            eq("user.id",user.id)
        }
        subscriptionList.sort{
            b,a-> a.topic.lastUpdated<=>b.topic.lastUpdated}
        return subscriptionList
    }

    def subscriptioncount(List topicids) {
        def topiccounts = Subscription.createCriteria().list() {
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
        }.collect{it.getAt(0)
        }
        return counts
    }

    def postscount(List topicids) {
        def rescounts = Resources.createCriteria().list() {
                    projections{
                        count('topic.id')
                        groupProperty('topic.id')
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
        List interTopic = Topics.createCriteria().list{
            eq('visibility',newlinksharingapp.Visibility.PUBLIC)
        }.sort{a,b -> b.resource.size()<=>a.resource.size()}

        List<Topics> tl = []
        def i = 0
        while(i < 5 && interTopic.size()>i) {
            tl.add(interTopic.get(i))
            i++
        }
        return tl
    }

    def topTopicsPosts() {
        List<Long> topicsid = Topics.list().collect {
            it.id
        }

        List abcd = Resources.createCriteria().list(max: 5)
        {
            projections {
                count('topic.id')
                groupProperty('topic.id')
            }
        }

        abcd.sort { b, a -> a.getAt(0) <=> b.getAt(0) }
        List<Integer> xyz = topicsid.collect { x ->
            abcd.find {
                if (it.getAt(1) == x)
                    return it.getAt(0)
                else
                    return 0
            }
        }.collect {
            if (!it)
                return 0
            else
                it.getAt(0)
        }
        return xyz
    }

    def topTopicSubs() {
        List<Long> topicsid = Topics.list().collect {
            it.id
        }
        def topiccounts = Subscription.createCriteria().list() {
                    projections {
                        count('topic.id')
                        groupProperty('topic.id')
                    }
                    'topic' {
                        inList('id', topicsid)
                    }
                }
        List<Integer> counts = topicsid.collect { x ->
            topiccounts.find {
                if (it.getAt(1) == x)
                    return it.getAt(0)
            }
        }.collect {  if (!it)
            return 0
        else
            it.getAt(0) }
        return counts
    }

    def postByMe(String name){
        Users u = Users.findByEmail(name)
        List<Topics> myList = Topics.createCriteria().list{
            projections{
                eq('createdBy', u)
            }
        }
        return myList
    }
}