package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class SignupService {

    def signupMethod(params,request) {
        String password = params.password
        String confirmPassword = params.confirmpassword
        if(confirmPassword.compareTo(password)!= 0){
            return null
        }
        else{
            String username = params.username
            Boolean admin = 0
            Boolean active = 1

            def f = request.getFile('image')
            String fName = f.getOriginalFilename()
            String image1 = username+fName
            String loc = '/home/saurabh/Desktop/Link-Sharing/grails-app/assets/images/' + image1
            File des=new File(loc)
            f.transferTo(des)
            Users userRegister = new Users(firstName: params.firstname, lastName: params.lastname, email: params.email, username: username, password: password, admin: admin, active: active, photo: image1)
            userRegister.save(flush: true, failOnError: true, validate: true)
            return userRegister
        }
    }



    List<Resources> recentShare() {

        List<Resources> recentShare = Resources.createCriteria().list(max: 5){
            'topic' {
                eq('visibility', Visibility.PUBLIC)
            }
        }
        recentShare.sort { Resources r2, Resources r1 -> r1.dateCreated <=> r2.dateCreated }
    }

    List<Resources> postList(){
        List<Resources> topPosts = ResourcesRating.createCriteria().list(max: 5){
            projections {
                avg("score")
                groupProperty("resource.id")
            }
            'resource' {
                'topic' {
                    eq('visibility', Visibility.PUBLIC)
                }
            }
        }
        List<Long> resIds = topPosts.collect{
            it.getAt(1)
        }
        return resIds
    }
}
