package newlinksharingapp

class UsersController {

    def signupService
    def loginService
    def resetPasswordService
    def updatePasswordService

    def signup() {
        signupService.signupMethod(params,request)


        //render("Signup Successful")
    }



    def login() {
       Users loginValue = loginService.LoginMethod(params)

        if(loginValue) {

            session.name = loginValue.email
            redirect(controller: 'Dashboard', action: 'index')

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
