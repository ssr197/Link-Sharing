package linksharing

class Topic {
    String name
    Users createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    static belongsTo = [createdBy:Users]
    static hasMany = [resourcesHas:Resources, subscriptionsTo:Subscription]

    static constraints = {

    }
}
