package newlinksharingapp

class UsersController {

    def signupService

    def signup() {
        println 'inside controller'
        signupService.signupMethod(params)
        render( "Successful")



    }

}
