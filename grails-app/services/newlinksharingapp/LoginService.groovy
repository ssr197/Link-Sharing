package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class LoginService {

    def LoginMethod(Map params) {
        String loginEmail = params.l_email
        Users user = Users.findByEmail(loginEmail)
        String loginPassword = params.l_pwd

        if (loginEmail == null || loginPassword == null || !user || !user.active) {
            return null
        } else {
            def fetchPassword = user.password
            if (loginPassword == fetchPassword) {
                return user;
            } else {
                return null;
            }
        }
    }
}

