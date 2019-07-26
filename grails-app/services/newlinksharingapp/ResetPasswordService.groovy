package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class ResetPasswordService {

//    def serviceMethod() {
//
//    }

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

}

