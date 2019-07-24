package newlinksharingapp

import grails.transaction.Transactional

@Transactional


class UserListService {

    def AllUsers() {

        List AllUserList = Users.list()
        return AllUserList;
    }
}
