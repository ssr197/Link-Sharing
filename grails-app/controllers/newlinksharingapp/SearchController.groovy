package newlinksharingapp

class SearchController {

    def searchService

    def search() {
        if(!session.name){
            render("Please Login First")
        }else {
            List<String> resultSet = searchService.searchMethod(params.q)
            if (resultSet)
                render view: 'search', model: [result: resultSet]
            else {
                redirect(controller: "dashboard", action: "dashboard")
            }
        }
    }
}
