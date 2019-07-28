package newlinksharingapp

import grails.transaction.Transactional

import javax.jws.soap.SOAPBinding

@Transactional
class ResourcesService {

    def saveDocumentMethod(params, request, email) {
        Users u = Users.findByEmail(email)
        String userName = params.username
        String description = params.select
        String tname = params.topic

        def topicObject = Topics.findByName(tname)
        Integer tId = topicObject.id

        def f = request.getFile('document')
        //StringName =

    }
}
