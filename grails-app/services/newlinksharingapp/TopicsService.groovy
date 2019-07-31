package newlinksharingapp

import grails.transaction.Transactional
import org.h2.engine.User


@Transactional
class TopicsService {

    def addTopicMethod(params,email) {
        String topic_Name = params.topicName
        Users u2 = Users.findByEmail(email)
        Topics t2 = new Topics(name: topic_Name ,visibility: params.selection)
        u2.addToTopic(t2)

        if(t2.validate()){
            t2.save(failOnError: true, flush: true)
            u2.save(flush: true)
        } else{
            t2.errors.getAllErrors()
        }

        Subscription sub = new Subscription(seriousness: Seriousness.VERY_SERIOUS)
        u2.addToSubscribedTo(sub)
        t2.addToSubscribedTo(sub)
        if (sub.validate()) {
            sub.save(failOnError: true, flush: true)
        } else {
            print sub.errors.getAllErrors()
        }

    }

    def showListMethod(){
        List<Topics> topicList = Topics.list()
        return topicList
    }


    def deletePost(params){
        Long topic_id = Long.parseLong(params.variable1)
        String email = params.variable2
        Topics t1 = Topics.findById(topic_id)
        t1.delete(flush: true)
    }

    def subscriptioncount(List userslist){
        def usercounts = Subscription.createCriteria().list()
                {
                    projections{
                        count('user.id')
                        groupProperty('user.id')
                    }
                    'user'{
                        inList('id',userslist)
                    }
                }
        List <Integer> counts = userslist.collect{ x ->
            usercounts.find{
                if (it.getAt(1)==x)
                    return it.getAt(0)
            }
        }.collect{it.getAt(0)}
        return counts
    }

    def topiccount(List userslist){
        def topcounts=Topics.createCriteria().list()
                {
                    projections{
                        count('createdBy.id')
                        groupProperty('createdBy.id')
                    }
                    'createdBy'{
                        inList('id',userslist)
                    }
                }
        List <Integer> topiccount = userslist.collect{ x ->
            topcounts.find{
                if (it.getAt(1)==x)
                    return it.getAt(0)
            }
        }.collect{if(!it)
            return 0
        else
            it.getAt(0)}
        return topiccount
    }
}