package newlinksharingapp

import grails.transaction.Transactional

import javax.jws.soap.SOAPBinding

@Transactional
class ResourcesService {

    def saveDocumentMethod(params, request, email) {
        Users u = Users.findByEmail(email)
        String userName = u.username

        String description = params.select
        String tname = params.topics

        def topicObject = Topics.findByName(tname)
        Integer tId = topicObject.id

        def f = request.getFile('document')
        String fname = f.getOriginalFilename()

        String fPath = '/home/saurabh/Desktop/Link-Sharing/grails-app/assets/document/' + userName+fname
        File destination = new File(fPath)
        f.transferTo(destination)

        DocumentResource newRes = new DocumentResource(description: description, topic: tId, filePath: fPath)
        u.addToResource(newRes)
        topicObject.addToResource(newRes)
        newRes.save(flush:true, failOnError:true)
    }

    def saveLinkMethod(params, request, email){
        Users u = Users.findByEmail(email)
        String userName = u.username

        String description = params.selectlink
        String tname = params.topic

        println "This is topic name which is is recieved here"

        def tobj = Topics.findByName(tname)
        Integer tID = tobj.id
        String link = params.linkres
        LinkResource newRes = new LinkResource(description:description,topic:tID, url:link)
        u.addToResource(newRes)
        tobj.addToResource(newRes)
        newRes.save(flush:true,failOnError:true)
    }
}
