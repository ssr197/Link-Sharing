package linksharing

class Resources {
    String decription
    Users createdBy
    Topic topic
    String type
    Date dateCreated
    Date lastUpdated

    static hasMany = [readingItem:Reading_Item,resourceRate:Resource_Rating]
    static belongsTo = [topic:Topic,createdBy:Users]
    static constraints = {
        description nullable:true,size:0..100

    }
}