package newlinksharingapp

import grails.artefact.Controller
import org.h2.engine.User
class UsersController {

    def signupService
    def loginService
    def resetPasswordService
    def userListService

    def signup() {
        if(Users.findByEmail(params.email)){
            flash.message1 = "Email is used"
            redirect(url: '/')
        }
        if(Users.findByUsername(params.username)) {
            flash.message2 = "Username is used"
            redirect(url: "/")
        }
        else {
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
            Users x = Users.findByEmail(session.name)
            session.isAdmin = x.admin
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


    def showUserList(){
        if(!session.name){
            render("Please Login First")
        }else {
            List<User> listAll = userListService.AllUsers();
            Users u1 = Users.findByEmail(session.name)
            render(view: "userList", model: [allUserList: listAll, userdata: u1])
        }
    }

    def forgetpassword() {
        render view: "ForgetPassword"
    }

    def validateResetPasswordEmail(){
        if (resetPasswordService.validateEmail(params) == 1) {
            session.name = params.email
            render(view: 'resetNewPass')
        } else {
            render view: "login"
        }
    }

    def updatePassword(){
        String changePasswordOfEmail = session.name
        resetPasswordService.update(params, changePasswordOfEmail)
        session.invalidate()
        redirect(url: "/")
    }

    def openPageToChangeProfile(){
        if(!session.name){
            render("Please Login First")
        }else {
            render(view: "updateUserProfile")
        }
    }

    def updateProfile(){
        if(!session.name){
            render("Please Login First")
        }else {
            resetPasswordService.updateProfile(params, request, session.name)
            redirect(controller: "dashboard", action: "dashboard")
        }
    }

    def changeAdminPermission(){
        if(!session.name){
            render("Please Login First")
        }else {
            String key = params.variable1
            userListService.changerPermission(key)
            redirect(controller: "users", action: "showUserList")
        }
    }

    def makeAdmin(){
        if(!session.name){
            render("Please Login First")
        }else {
            String key = params.variable2
            userListService.adminMethod(key)
            redirect(controller: "users", action: "showUserList")
        }
    }
}