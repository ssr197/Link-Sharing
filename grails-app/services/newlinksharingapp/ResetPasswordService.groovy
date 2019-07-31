package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class ResetPasswordService {


    def validateEmail(Map params) {
        String email = params.email
        Users userExists = Users.findByEmail(email)

        if(userExists) {
            return 1
        } else {
            return 0
        }
    }

    def update(Map params, String email){
        String pass = params.newpassword
        Users ux = Users.findByEmail(email)
        ux.password = pass
        ux.save(failOnError:true, flush:true)


    }
    def updateProfile(params, request, email){
        Users u1 = Users.findByEmail(email)
        String firstName = params.fname
        String lastName = params.lname
        String userName = params.uname

        if(userName != null) {
            u1.username = userName
            u1.save(failOnError: true, flush: true)
        }
        if(firstName != null)
        {
            u1.firstName = firstName
            u1.save(failOnError: true, flush: true)
        }

        if(lastName != null){
            u1.lastName = lastName
            u1.save(failOnError: true, flush: true)
        }
    }
}

