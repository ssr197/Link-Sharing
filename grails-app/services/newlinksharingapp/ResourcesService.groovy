package newlinksharingapp

import grails.transaction.Transactional

import javax.jws.soap.SOAPBinding

@Transactional
class ResourcesService {

    def saveDocumentMethod(params, request, email) {
        Users user = Users.findByEmail(email)

        def topicObject = Topics.findByName(params.topics)
        Long topicId = topicObject.id

        def f = request.getFile('document')
        String fname = f.getOriginalFilename()

        String fPath = '/home/saurabh/Desktop/Link-Sharing/grails-app/assets/document/' + user.username + fname
        File destination = new File(fPath)
        f.transferTo(destination)

        DocumentResource newResource = new DocumentResource(description: params.select, topic: topicId, filePath: fPath)
        user.addToResource(newResource)
        topicObject.addToResource(newResource)
        newResource.save(flush: true, failOnError: true)
        List subscriberList = subscribersList(topicId)
        addToUnreadItem(subscriberList, newResource)
    }

    def saveLink(params, email) {

        Users user = Users.findByEmail(email)
        Topics topicObject = Topics.findByName(params.topic)
        Long topicId = topicObject.id
        String link = params.linkres
        LinkResource newResource = new LinkResource(description: params.selectlink, topic: topicId, url: link)
        user.addToResource(newResource)
        topicObject.addToResource(newResource)
        newResource.save(flush: true, failOnError: true)
        List subscriberList = subscribersList(topicId)
        addToUnreadItem(subscriberList, newResource)
    }

    def AllPostList() {
        List<Resources> resourceList = Resources.createCriteria().list {
            'topic' {
                eq('visibility', Visibility.PUBLIC)
            }
        }
        return resourceList
    }


    def subscribersList(topicId) {
        List<Users> userIds = Subscription.createCriteria().list {
            projections {
                property('user.id')
            }
            eq('topic.id', topicId)
        }
        return userIds
    }


    def addToUnreadItem(subscriberList, newResource) {
        Boolean isRead = false
        subscriberList.each {
            Users us = Users.get(it)
            ReadingItem readItem = new ReadingItem(isRead: isRead, resource: newResource, user: us)
            readItem.save(failOnError: true, flush: true)
            us.addToReadItem(readItem)
            newResource.addToReadingItem(readItem)
            us.save(flush: true, failOnError: true)
            newResource.save(flush: true, failOnError: true)
        }
    }

}
