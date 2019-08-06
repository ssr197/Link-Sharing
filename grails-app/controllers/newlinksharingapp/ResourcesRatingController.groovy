package newlinksharingapp

import grails.converters.JSON

class ResourcesRatingController {
    def resourcesRatingService

    def saveRating() {
        resourcesRatingService.saveRatingForUser(params)
        render ([success: true] as JSON)
    }
}
