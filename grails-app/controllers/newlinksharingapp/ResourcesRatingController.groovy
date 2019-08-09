package newlinksharingapp

import grails.converters.JSON

class ResourcesRatingController {
    def resourcesRatingService

    def saveRating() {
        if (!session.name) {
            redirectToHome()
        } else {
            resourcesRatingService.saveRatingForUser(params)
            render([success: true] as JSON)
        }
    }

    def redirectToHome() {
        flash.message = "Login First!!!"
        redirect url: '/'
    }
}
