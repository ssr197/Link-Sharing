package newlinksharingapp

import grails.transaction.Transactional

@Transactional


class UserListService {

    def AllUsers() {
        List AllUserList = Users.list()
        return AllUserList;
    }

    def activateOrDeactivateUser(String name) {
        Users user = Users.findByEmail(name)
        if (user.id != 2) {
            if (user.active) {
                user.active = false
            } else {
                user.active = true
            }
        }
        user.save(failOnError: true, flush: true)
        return user
    }

    def makeAdmin(String email) {
        Users user = Users.findByEmail(email)
        if (user.id != 2) {
            if (user.admin) {
                user.admin = false
            } else {
                user.admin = true
            }
        }
        user.save(failOnError: true, flush: true)
        return user
    }
}
