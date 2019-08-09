package newlinksharingapp

class Topics {

    String name
    Users createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility

    static belongsTo = [createdBy: Users]
    static hasMany = [resource: Resources, subscribedTo: Subscription]

    static constraints = {

    }
}
