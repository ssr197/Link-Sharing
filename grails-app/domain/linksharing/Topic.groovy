package linksharing

class Topic {
String name
    User1 createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility

    static belongsTo = [createdBy:User1]
    static hasMany = [resource:Resource1, subscribedTo:Subscription]


    static constraints = {

    }

}
