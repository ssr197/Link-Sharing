package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class ResourcesRatingService {

    def saveRatingForUser(params) {
        int rating = Integer.parseInt(params.value)
        Users user = Users.findByEmail(params.username)
        Long resourceId = Long.parseLong(params.resourceId)

        Resources resource = Resources.get(resourceId)

        ResourcesRating resourceRateing = ResourcesRating.createCriteria().get {
            eq('user.id', user.id)
            eq('resource.id', resource.id)
        }


        if (resourceRateing) {
            resourceRateing.score = rating
            resourceRateing.save(flush: true, failOnError: true)
        } else {
            ResourcesRating resourceRate = new ResourcesRating(score: rating)
            resource.addToResourceRated(resourceRate)
            user.addToResourceRated(resourceRate)
            user.save(flush: true, failOnError: true)
            resource.addToResourceRated(resourceRate)
            resource.save(flush: true, failOnError: true)
            resourceRate.save(flush: true, failOnError: true)
        }
    }

    def readrating(email, Resources res) {
        Users user = Users.findByEmail(email)
        ResourcesRating resourceRating = ResourcesRating.createCriteria().get {
            eq('user.id', user.id)
            eq('resource.id', res.id)
        }

        if (resourceRating) {
            return resourceRating.score
        } else
            return 0
    }
}
