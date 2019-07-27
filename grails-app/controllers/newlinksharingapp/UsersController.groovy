package newlinksharingapp

import org.h2.engine.User

class UsersController {

    def signupService
    def loginService
    def resetPasswordService
    //def updatePasswordService
    def userListService

// if Sign up successful, Returning to dashboard otherwise rendering text "Not successfull"
    def signup() {
        def signUpValue = signupService.signupMethod(params,request)
        if(signUpValue){
            session.name = signUpValue.email
            redirect(controller: 'dashboard', action: 'dashboard')
        } else{
            render text: "Not Successful"
        }
    }


    // forwarding to loginService, redirecting to dashboard if successful otherwise to not successful
    def login() {
       Users loginValue = loginService.LoginMethod(params)
        if(loginValue) {
            session.name = loginValue.email
            redirect(controller: 'dashboard', action: 'dashboard')
        }
        else {
            render view: 'login'
        }
    }


    //Ending the session on log out and redirecting to login page
    def logout() {
        session.invalidate()
        redirect(url:"/")
    }

    //Show the list of all the users available
    def showUserList(){
        List<User> listAll = userListService.AllUsers();
        render(view: "userList", model: [allUserList:listAll])

    }
    //redirecting to forget password page
    def forgetpassword() {

        render view: "ForgetPassword"
    }

    //check if email is present in database or not and act accordingly.
    def validateResetPasswordEmail(){

        if(resetPasswordService.validateEmail(params)==1){
            session.resetPass = params.fetchEmail
            render(view: 'resetNewPass')
        }else{
            render view: "login"
        }
    }
    def updatePassword(){
        String changePasswordOfEmail = session.resetPass
        resetPasswordService.update(params,changePasswordOfEmail)
        session.invalidate()
        render("Please login with new password")
    }

}
