package newlinksharingapp


import org.h2.engine.User

class UsersController {

    def signupService
    def loginService
    def resetPasswordService
    def userListService
    def dashboardService

    def index() {
        def recent = signupService.recentShare()
        def postListt = signupService.postList()
        [posts: postListt, resources: recent]
    }

    def signup() {
        if (Users.findByEmail(params.email)) {
            flash.message1 = "Email is used"
            redirect(url: '/')
        } else if (Users.findByUsername(params.username)) {
            flash.message2 = "Username is used"
            redirect(url: "/")
        } else {
            def signUpValue = signupService.signupMethod(params, request)
            if (signUpValue) {
                session.name = signUpValue.email
                redirect(controller: 'dashboard', action: 'dashboard')
            } else {
                render text: "Not Successful"
            }
        }
    }

    def login() {

        Users loginValue = loginService.LoginMethod(params)
        if (loginValue) {
            session.name = loginValue.email
            Users user = Users.findByEmail(session.name)
            session.isAdmin = user.admin
            redirect(controller: 'dashboard', action: 'dashboard')
        } else {
            flash.message = "Login Failed"
            redirect(url: "/")
        }
    }

    def logout() {
        session.invalidate()
        redirect(url: "/")
    }

    def showUserList() {
        if (!session.name) {
            redirectToHome()
        } else {
            List<User> listAll = userListService.AllUsers();
            Users u1 = Users.findByEmail(session.name)
            render(view: "userList", model: [allUserList: listAll, userdata: u1])
        }
    }

    def forgetpassword() {
        render view: "ForgetPassword"
    }

    def validateResetPasswordEmail() {
        if (resetPasswordService.validateEmail(params) == 1) {
            session.name = params.email
            render(view: 'resetNewPass')
        } else {
            render view: "login"
        }
    }

    def updatePassword() {
        String changePasswordOfEmail = session.name
        resetPasswordService.update(params, changePasswordOfEmail)
        session.invalidate()
        redirect(url: "/")
    }

    def openPageToChangeProfile() {
        if (!session.name) {
            redirectToHome()
        } else {
            Users user = Users.findByEmail(session.name)
            Integer subsCount = dashboardService.sCount(session.name)
            Integer topicCount = dashboardService.totalTopicCount(session.name)
            render(view: 'updateUserProfile', model: [userdata: user, count_topic: topicCount, count_subscribe: subsCount])
        }
    }

    def updateProfile() {
        if (!session.name) {
            redirectToHome()
        } else {
            resetPasswordService.updateProfile(params, request, session.name)
            redirect(controller: "dashboard", action: "dashboard")
        }
    }

    def changeActiveStatus() {
        if (!session.name) {
            redirectToHome()
        } else {
            String key = params.variable1
            userListService.activateOrDeactivateUser(key)
            redirect(controller: "users", action: "showUserList")
        }
    }

    def makeAdmin() {
        if (!session.name) {
            redirectToHome()
        } else {
            String key = params.variable2
            userListService.makeAdmin(key)
            redirect(controller: "users", action: "showUserList")
        }
    }

    def redirectToHome() {
        flash.message = "Login First!!!"
        redirect url: '/'
    }

}