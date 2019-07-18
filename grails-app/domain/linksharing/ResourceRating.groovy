package linksharing

class ResourceRating {

    Resource1 resource
    User1 user
    Integer score
    static belongsTo = [user:User1, resource:Resource1]

    static constraints = {
        score range:0..5,nullable:true
    }
}
