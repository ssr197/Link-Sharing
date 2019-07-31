package newlinksharingapp

class SendingLinkController {
def resetPasswordService
    def index() {
        Users user = Users.findByEmail(params.fetchEmail)
        String link = createLink(controller: 'users', action: 'validateResetPasswordEmail', params: [email: user.email], absolute: true)
        sendMail {
            to "${user.email}"
            subject "Hello ${user.firstName} Your password reset link is here!!!"
            text link
        }
        render("Check Your Mail")
    }
}
