package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class ResourcesRatingService {

    def saveMethod() {
//        print "very much inside"
        int rating = Integer.parseInt(params.value)
        Users user = Users.findByEmail(params.username)
        Long resourceId = Long.parseLong(params.resourceId)
        Resources res = Resources.get(resourceId)
        ResourcesRating resRate = ResourcesRating.createCriteria().get{
            eq('userRated.id',user.id)
            eq('resource.id',res.id)
        }

        if(resRate) {
            resRate.score = rating
            resRate.save(flush:true)
        } else{
            ResourcesRating resourceRate = new ResourcesRating(score:rating,userRated: user)
            //println "??????????????????? resource rate object"+resourceRate.score
            resourceRate.save(failOnError: true)
            user.addToResourceRated(resourceRate)
            res.addToResourceRated(resourceRate)
            user.save(failOnError: true)
            res.save(failOnError: true)
        }
    }
}
