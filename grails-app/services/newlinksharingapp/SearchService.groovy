package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class SearchService {

    def searchMethod(String searchKey) {
        String searchWord = searchKey

        if (searchWord == null || searchWord == 'all')
            return null

        List<String> topicResults = Topics.createCriteria().list {
            ilike("name", "%${searchWord}%")
        }.collect { it.name }

        List<String> resourceResults = Resources.createCriteria().list {
            ilike("description", "%${searchWord}%")
        }.collect { it.description }
        List<String> resultSet = topicResults + resourceResults
        return resultSet
    }
}

