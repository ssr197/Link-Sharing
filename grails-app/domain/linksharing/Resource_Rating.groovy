package linksharing

class Resource_Rating {
    Resources resource
    Users user
    Integer score

    static belongsTo = [user:Users,resource:Resources]

    static constraints = {
        score range:0..5,nullable:true
    }
}
