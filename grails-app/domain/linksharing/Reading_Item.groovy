package linksharing

class Reading_Item {
    Resources resource
    Users users
    Boolean isRead

    static belongsTo = [users:Users,resource:Resources]

    static constraints = {

    }
}
