package newlinksharingapp

class Users {

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
    Date lastUpdated

    //relation to table ReadingItem and table ResourceRating
    static hasMany =
            [subscribedTo:Subscription,
             topic:Topics,
             resource:Resources,
             readItem:ReadingItem,
             resourceRated:ResourcesRating]

    //setting the constraints
    static constraints = {
        email(unique:true, email:true)
        username(unique:true)
        photo(nullable:true)
        password blank: false, nullable: false, minSize: 4, maxSize: 64
    }
}