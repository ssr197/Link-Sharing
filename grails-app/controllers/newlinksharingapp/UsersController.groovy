package newlinksharingapp

class UsersController {

    def signupService
    def loginService
    def resetPasswordService
    def updatePasswordService

    def signup() {
        signupService.signupMethod(params,request)

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
