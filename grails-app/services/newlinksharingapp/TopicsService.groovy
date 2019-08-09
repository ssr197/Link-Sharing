package newlinksharingapp

import grails.transaction.Transactional
import org.h2.engine.User


@Transactional
class TopicsService {

    def addTopicMethod(params, email) {
        Users user = Users.findByEmail(email)
        Topics topic = new Topics(name: params.topicName, visibility: params.selection)
        user.addToTopic(topic)

        if (topic.validate()) {
            topic.save(failOnError: true, flush: true)
            user.save(flush: true)
        } else {
            topic.errors.getAllErrors()
        }
        Subscription subscription = new Subscription(seriousness: Seriousness.VERY_SERIOUS)
        user.addToSubscribedTo(subscription)
        topic.addToSubscribedTo(subscription)
        if (subscription.validate()) {
            subscription.save(failOnError: true, flush: true)
        } else {
            print subscription.errors.getAllErrors()
        }
    }

    def showListMethod() {
        List<Topics> topicList = Topics.list()
        return topicList
    }


    def deletePost(params) {
        String email = params.variable2
        Topics topic = Topics.findById(Long.parseLong(params.variable1))
        topic.delete(flush: true)
    }

    def subscriptioncount(List userslist) {
        def usercounts = Subscription.createCriteria().list()
                {
                    projections {
                        count('user.id')
                        groupProperty('user.id')
                    }
                    'user' {
                        inList('id', userslist)
                    }
                }
        List<Integer> counts = userslist.collect { x ->
            usercounts.find {
                if (it.getAt(1) == x)
                    return it.getAt(0)
            }
        }.collect { it.getAt(0) }
        return counts
    }


    def topiccount(List userslist) {
        def topcounts = Topics.createCriteria().list()
                {
                    projections {
                        count('createdBy.id')
                        groupProperty('createdBy.id')
                    }
                    'createdBy' {
                        inList('id', userslist)
                    }
                }
        List<Integer> topiccount = userslist.collect { x ->
            topcounts.find {
                if (it.getAt(1) == x)
                    return it.getAt(0)
            }
        }.collect {
            if (!it)
                return 0
            else
                it.getAt(0)
        }
        return topiccount
    }
}