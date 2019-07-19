package linksharing

class Users {
    String email
    String username
    String password
    String firstName
    String lastName
    Byte photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated
    static hasMany = [subscribedTo: Subscription, topicscreated: Topic, resourcescreated: Resources, readItem: Reading_Item, resourceRated: Resource_Rating]

    static constraints = {
        email(unique: true, email: true)
        username(unique: true)
        //password(size: 12..15, matches: "[a-zA-Z0-9]+")
        photo(nullable: true)
    }
}