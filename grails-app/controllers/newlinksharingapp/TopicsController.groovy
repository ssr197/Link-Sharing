package newlinksharingapp

import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicsController {
def topicsService
    def addTopics() {
        String email = session.name
 //       println "params.selection "+email
 //       println "topic selection = "+ params.selection
 //       Visibility vi = Visibility.PRIVATE
        topicsService.addTopicMethod(params,email)

        redirect(controller: "dashboard", action: "dashboard")

    }





}
