package newlinksharingapp

class Subscription {

    Topics topic
    Users user
    Date dateCreated
    Seriousness seriousness

    static belongsTo = [user: Users, topic: Topics]

    static constraints = {

    }
}
