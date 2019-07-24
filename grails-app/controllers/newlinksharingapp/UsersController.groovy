package newlinksharingapp

class UsersController {

    def signupService
    def loginService
    def resetPasswordService
    def updatePasswordService

    def signup() {
        signupService.signupMethod(params)
        //render("Signup Successful")
    }



    def login() {
        Integer loginValue = loginService.LoginMethod(params)

        if(loginValue == 1) {

            render(text: "Logged In")
        }
        else {
            render "Wrong passkey"
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



/*

    def validateResetPasswordEmail(){
        Users userFromService = resetPasswordService.validateEmail(params)

        if(userFromService) {
            session.email = userFromService.email
            redirect(action: 'updatepassword', params: [email: params.email])
        }

    }
*/

//
//    def updatepassword(){
//        //render(text: "Hello")
//         String emailToService = session.email
//
//        updatePasswordService.savePassword(emailToService)
//    }
}
