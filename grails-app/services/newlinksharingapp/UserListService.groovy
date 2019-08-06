package newlinksharingapp

import grails.transaction.Transactional

@Transactional


class UserListService {

    def AllUsers() {

        List AllUserList = Users.list()
        return AllUserList;
    }

    def changerPermission(String name){
        Users u = Users.findByEmail(name)
        if(u.id != 2) {
            if (u.active) {
                u.active = false
            } else {
                u.active = true
            }
        }
        u.save(failOnError: true, flush: true)
        return u
    }
    def adminMethod(String email){
        Users u = Users.findByEmail(email)
        if(u.id != 2){
            if(u.admin){
                u.admin = false
            }else{
                u.admin = true
            }
        }
        u.save(failOnError: true, flush: true)
        return u
    }
}
