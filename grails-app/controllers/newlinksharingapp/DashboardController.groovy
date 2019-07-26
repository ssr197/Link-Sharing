package newlinksharingapp

class DashboardController {

    def dashboardService


    def dashboard() {
        Users u1 = Users.findByEmail(session.name)
        Integer topicCount = dashboardService.totalTopicCount(session.name)
        Integer subsCount = dashboardService.subscriptionCount(session.name)
        render(view: "dashboard", model: [  userdata : u1, topicCount : topicCount, sessionCountNumber:subsCount])
    }

    def forwardToUploadDocument(){
        render(view: "uploadNewDocument")
    }
    def forwardToUploadLink(){
        render(view: "uploadNewLink")
    }
}