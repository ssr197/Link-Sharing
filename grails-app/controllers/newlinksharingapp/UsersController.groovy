package newlinksharingapp

import org.h2.engine.User

class UsersController {

    def signupService
    def loginService
    def resetPasswordService
    def updatePasswordService
    def userListService

    def signup() {
        def signUpValue = signupService.signupMethod(params,request)


        if(signUpValue){
            session.name = signUpValue.email
            redirect(controller: 'Dashboard', action: 'index')
        }

        else{
            render text: "Not Successful"
        }

    }

    def login() {
       Users loginValue = loginService.LoginMethod(params)

        if(loginValue) {

            session.name = loginValue.email
            redirect(controller: 'Dashboard', action: 'index')

        }
        else {
            render view: 'login'
        }
    }

    def showUserList(){
        List<User> listAll = userListService.AllUsers();
        render(view: "userList", model: [allUserList:listAll])

    }










    def forgetpassword() {

        render view: "ForgetPassword"
    }



    def validateResetPasswordEmail(){
        /*Users userFromService = */
        if(resetPasswordService.validateEmail(params)==1){
            render(view: 'resetNewPass')
        }else{
            render(text: "Email Does Not Exists")

        }
    }
}
