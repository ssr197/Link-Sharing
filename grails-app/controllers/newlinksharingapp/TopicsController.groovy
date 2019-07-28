package newlinksharingapp

import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicsController {
def topicsService
    def addTopics() {
        String email = session.name
        println "inside Topic Controller " + email
        topicsService.addTopicMethod(params,email)

        redirect(controller: "dashboard", action: "dashboard")

    }





}
