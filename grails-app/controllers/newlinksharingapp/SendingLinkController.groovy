package newlinksharingapp

class SendingLinkController {
    def resetPasswordService

    def index() {
        Users user = Users.findByEmail(params.fetchEmail)
        if (user) {
            String link = createLink(controller: 'users', action: 'validateResetPasswordEmail', params: [email: user.email], absolute: true)
            sendMail {
                to "${user.email}"
                subject "Hello ${user.firstName} Your password reset link is here!!!"
                text link
            }
            render("Check Your Mail")
        } else {
            redirect(controller: "users", action: "validateResetPasswordEmail")
        }
    }


    def sendInvite() {
        Users user = Users.findByEmail(params.email)
        if (!user)
            user = Users.findByEmail(params.email)
        Topics topic = Topics.findByName(params.topicName)
        Long topicId = topic.id
        String link = createLink(controller: 'subscriptions', action: 'sendSubscrioptionInvite', params: [id: topicId, email: user.email], absolute: true)
        sendMail {
            to "${user.email}"
            subject "Hello ${user.firstName} You have been invited to join this topic at LinkSharing!!!"
            text link
        }
        redirect controller: 'dashboard', action: 'dashboard'
    }
}
