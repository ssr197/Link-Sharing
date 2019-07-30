package newlinksharingapp

class SearchController {

    def searchService

    def search()
    {
        List<String> resultSet = searchService.searchMethod(params.q)
        if(resultSet)
            render view:'search',model:[result:resultSet]
        else {
            redirect (controller: "dashboard", action: "dashboard")
        }
    }
}
