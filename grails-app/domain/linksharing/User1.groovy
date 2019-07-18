package linksharing

class User1 {
    //creating all the required variables...
    String firstName
    String lastName
    String username
    String email
    String password
    Byte photo
    Boolean active
    Boolean admin
    Date dateCreated
    Date dateUpdated

    //relation to table ReadingItem and table ResourceRating
    static hasMany = [subscribedTo:Subscription, topic:Topic, resource:Resource1, readItem:ReadingItem, resourceRated:ResourceRating]




    //setting the constraints
    static constraints = {
        email(unique:true, email:true)
        username(unique:true)
        password(minSsize:6,maxSize:30)
        photo(nullable:true)
    }
}
