package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class SearchService {

    def searchMethod(String searchKey) {

        println "inside service with ${searchKey}"
        String entry = searchKey

        if (entry==null)
            return null

        List<String> topicResults = Topics.createCriteria().list{
            ilike("name","%${entry}%")
        }.collect{it.name}

        List<String> resourceResults = Resources.createCriteria().list{
            ilike("description","%${entry}%")
        }.collect{it.description}
        println ">>>>>>>>>>>>>${topicResults}"
        println ">>>>>>>>>>>>>${resourceResults}"
        List<String> resultSet = topicResults + resourceResults
        return resultSet
    }
}

