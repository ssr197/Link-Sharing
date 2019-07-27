package newlinksharingapp

class SubscriptionsController {
    def subscriptionService

    def updateSerious() {
        subscriptionService.seriousness(params)
        redirect(controller: "dashboard", action: "dashboard")

    }
}
