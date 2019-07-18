package linksharing

class Subscription {

    Topic topic
    User1 user
    Date dateCreated
    Seriousness seriousness

    static belongsTo = [user:User1, topic:Topic]

    static constraints = {

    }
}
