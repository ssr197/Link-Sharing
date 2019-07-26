package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class SignupService {

    def signupMethod(params,request) {
        String password = params.password
        String confirmPassword = params.confirmpassword
        if(confirmPassword.compareTo(password)!= 0){
            return 0
        }
        else{
            String firstname = params.firstname
            String lastname = params.lastname
            String email = params.email
            String username = params.username
            Boolean admin = 0
            Boolean active = 1
            String uname = params.username
            def f = request.getFile('image')
            String loc = '/home/saurabh/Desktop/Link-Sharing/grails-app/assets/images/' + uname +'.png'
            File des=new File(loc)
            f.transferTo(des)
            Users userRegister = new Users(firstName: firstname, lastName: lastname, email: email, username: username, password: password, admin: admin, active: active, photo: loc)
            userRegister.save(flush: true, failOnError: true, validate: true)
            //return userRegister
            //return userRegister
        }
    }
}
