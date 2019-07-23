package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class LoginService {

    def LoginMethod(Map params) {
        String emailOrUsername = params.l_email
        String loginPassword = params.l_pwd

        if(emailOrUsername == null || loginPassword == null){
            return 0
        }
        else {


            def fetchUser = Users.findByEmail(emailOrUsername)
            def fetchPassword = fetchUser.password

            if(loginPassword == fetchPassword){
                return fetchUser;
            }else{
                return 0;
            }
        }

    }
}

