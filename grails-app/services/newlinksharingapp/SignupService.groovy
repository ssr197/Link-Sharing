package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class SignupService {

    def signupMethod(params) {

        //println 'inside service'
        String firstname = params.firstname
        String lastname = params.lastname
        String email = params.email
        String username = params.username
        String password = params.password
        String confirmPassword = params.confirmpassword
        String admin = 0
        String active = 1

        Users userRegister = new Users (firstName: firstname, lastName:lastname, email:email, username:username, password:password, admin:admin, active:active)
        userRegister.save(flush:true,failOnError:true,validate:true)
        //println 'saved'
    }
}
