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
        Long tId = topicObject.id

        def f = request.getFile('document')
        String fname = f.getOriginalFilename()

        String fPath = '/home/saurabh/Desktop/Link-Sharing/grails-app/assets/document/' + userName+fname
        File destination = new File(fPath)
        f.transferTo(destination)

        DocumentResource newRes = new DocumentResource(description: description, topic: tId, filePath: fPath)
        u.addToResource(newRes)
        topicObject.addToResource(newRes)
        newRes.save(flush:true, failOnError:true)

        List<Users> userIds = Subscription.createCriteria().list{
            projections{
                property('user.id')
            }
            eq('topic.id',tId)
        }


        Boolean isRead = false

        userIds.each {
            Users us = Users.get(it)
            ReadingItem ri = new ReadingItem(isRead:isRead,resource:newRes,user:us)
            ri.save(failOnError: true, flush: true)
            us.addToReadItem(ri)
            newRes.addToReadingItem(ri)
            us.save(flush:true,failOnError:true)
            newRes.save(flush:true,failOnError:true)
        }

    }

    def saveLinkMethod(params, request, email){

        Users u = Users.findByEmail(email)
        String userName = u.username
        String description = params.selectlink
        String tname = params.topic
        def tobj = Topics.findByName(tname)
        //Integer tID = tobj.id
        Long tID = tobj.id
        //Long topic_id = Long.parseLong(tID)
        String link = params.linkres
        LinkResource newRes = new LinkResource(description:description,topic:tID, url:link)
        u.addToResource(newRes)
        tobj.addToResource(newRes)
        newRes.save(flush:true,failOnError:true)

        List<Users> userIds = Subscription.createCriteria().list{
            projections{
                property('user.id')
            }
            eq('topic.id', tID)
        }


        Boolean isRead = false

        userIds.each {
            Users us = Users.get(it)
            ReadingItem ri = new ReadingItem(isRead:isRead,resource:newRes,user:us)
            ri.save(failOnError: true, flush: true)
            us.addToReadItem(ri)
            newRes.addToReadingItem(ri)
            us.save(flush:true,failOnError:true)
            newRes.save(flush:true,failOnError:true)
        }
    }
}
