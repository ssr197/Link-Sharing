package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class LoginService {

    def LoginMethod(Map params) {
        String emailOrUsername = params.l_email
        Users x1 = Users.findByEmail(emailOrUsername)
        if(!x1){
            Users x2 = Users.findByUsername(emailOrUsername)
        }

        String loginPassword = params.l_pwd
        if(emailOrUsername == null || loginPassword == null || !x1 || !x1.active){
            return null
        }
        else {
            def fetchPassword = x1.password
            if(loginPassword == fetchPassword){
                return x1;
            }else{
                return null;
            }
        }
    }
}

