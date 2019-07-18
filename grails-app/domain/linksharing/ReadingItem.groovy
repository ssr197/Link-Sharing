package linksharing

class ReadingItem {

    Resource1 resource
    User1 user
    Boolean isRead
    static belongsTo = [user:User1, resource:Resource1]
    static constraints = {

    }
}
