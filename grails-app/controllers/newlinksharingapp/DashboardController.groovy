package newlinksharingapp

class DashboardController {


    def index() {
        Users user1 = Users.findByEmail(session.name)
        println session.name
        //def topic = user1.topic.size()
        render(view: 'dashboard', model: [userdata: user1])
    }
}
