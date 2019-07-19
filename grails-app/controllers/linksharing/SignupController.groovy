package linksharing

class SignupController {

    def signupService
    def index() {
        println 'inside controller'
        signupService.registerMethod(params)
       // render(view)
    }
}
