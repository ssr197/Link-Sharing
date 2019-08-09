package newlinksharingapp

import grails.transaction.Transactional

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
        List<Long> subscriptionList = Subscription.createCriteria().list {
            eq("user.id", user.id)
        }
        subscriptionList.sort {
            b, a -> a.topic.lastUpdated <=> b.topic.lastUpdated
        }
        return subscriptionList
    }


    def subscriptioncount(List topicids) {
        def topiccounts = Subscription.createCriteria().list() {
            projections {
                count('topic.id')
                groupProperty('topic.id')
            }
            'topic' {
                inList('id', topicids)
            }
        }
        List<Integer> counts = topicids.collect { x ->
            topiccounts.find {
                if (it.getAt(1) == x)
                    return it.getAt(0)
            }
        }.collect {
            it.getAt(0)
        }
        return counts
    }

    def postscount(List topicids) {
        def rescounts = Resources.createCriteria().list() {
            projections {
                count('topic.id')
                groupProperty('topic.id')
            }
            'topic' {
                inList('id', topicids)
            }
        }
        List<Integer> resourcecount = topicids.collect { x ->
            rescounts.find {
                if (it.getAt(1) == x)
                    return it.getAt(0)
            }
        }.collect {
            if (!it)
                return 0
            else
                it.getAt(0)
        }
        return resourcecount
    }

    def trendtopics() {
        List interTopic = Topics.createCriteria().list {
            eq('visibility', newlinksharingapp.Visibility.PUBLIC)
        }.sort { a, b -> b.resource.size() <=> a.resource.size() }

        List<Topics> topicList = []
        for (int i = 0; i < 5 && interTopic.size() > i; i++) {
            topicList.add(interTopic.get(i))
        }
        return topicList
    }


    def postByMe(String name) {
        Users u = Users.findByEmail(name)
        List<Topics> myList = Topics.createCriteria().list {
            projections {
                eq('createdBy', u)
            }
        }
        return myList
    }
}