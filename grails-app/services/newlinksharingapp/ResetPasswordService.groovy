package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class ResetPasswordService {

    def validateEmail(Map params) {
        if (Users.findByEmail(params.email)) {
            return 1
        } else {
            return 0
        }
    }

    def update(Map params, String email) {
        Users user = Users.findByEmail(email)
        user.password = params.newpassword
        user.save(failOnError: true, flush: true)
    }

    def updateProfile(params, request, email) {
        Users user = Users.findByEmail(email)
        user.username = params.uname
        user.firstName = params.fname
        user.lastName = params.lname

        def f = request.getFile('inputphoto')
        String fName = f.getOriginalFilename()
        String image1 = user.username + fName
        String loc = '/home/saurabh/Desktop/Link-Sharing/grails-app/assets/images/' + image1
        File des = new File(loc)
        f.transferTo(des)
        user.photo = image1
        user.save(failOnError: true, flush: true)
    }
}

