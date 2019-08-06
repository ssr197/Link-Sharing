package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class ResourcesRatingService {

    def saveRatingForUser(params) {
        int rating = Integer.parseInt(params.value)
        Users user = Users.findByEmail(params.username)
        Long resourceId = Long.parseLong(params.resourceId)

        Resources res = Resources.get(resourceId)

        ResourcesRating resRate = ResourcesRating.createCriteria().get{
            eq('user.id',user.id)
            eq('resource.id',res.id)
        }


        if(resRate) {
            resRate.score = rating
            resRate.save(flush:true, failOnError: true)
        } else{
            ResourcesRating resourceRate = new ResourcesRating(score:rating)
            res.addToResourceRated(resourceRate)
            user.addToResourceRated(resourceRate)
            user.save(flush: true, failOnError: true)
            res.addToResourceRated(resourceRate)
            res.save(flush: true, failOnError: true)
            resourceRate.save(flush: true, failOnError: true)
        }
    }

    def readrating(email, Resources res)
    {
        Users user = Users.findByEmail(email)
        ResourcesRating resRate = ResourcesRating.createCriteria().get{
            eq('user.id',user.id)
            eq('resource.id',res.id)
        }

        if(resRate)
        {
            return resRate.score
        }
        else
            return 0
    }
}
