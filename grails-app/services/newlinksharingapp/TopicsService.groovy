package newlinksharingapp

import grails.transaction.Transactional
import org.h2.engine.User


@Transactional
class TopicsService {

    def addTopicMethod(params,email) {
        String topic_Name = params.topicName

//        println "topic name = "+topic_Name
//        println "topic selection = "+ params.selection

        Users u2 = Users.findByEmail(email)
        Topics t2 = new Topics(name: topic_Name ,visibility: params.selection)

        println "User 2 = "+u2
        println "Topic name =" + t2.name

        u2.addToTopic(t2)
        if(t2.validate()){
            t2.save(failOnError: true, flush: true)
            u2.save(flush: true)
        } else{
            t2.errors.getAllErrors()
        }
    }
}
