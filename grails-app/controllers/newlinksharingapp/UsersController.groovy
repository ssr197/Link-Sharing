package newlinksharingapp

class UsersController {

    def signupService
    def loginService

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
}
