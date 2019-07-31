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
}
