package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class ResetPasswordService {


    def validateEmail(Map params) {
        String email = params.fetchEmail
        Users userExists = Users.findByEmail(email)

        if(userExists) {
            return 1
        } else {
            return 0
        }
            //redirect (uri: "users/resetNewPass")
    }

    def update(Map params, String email){
        String pass = params.newpassword
        println "The new pasword which is recieved here is "+ pass
        //Write logic to update password
        Users ux = Users.findByEmail(email)
        ux.password = pass
        ux.save(failOnError:true, flush:true)


    }
}

