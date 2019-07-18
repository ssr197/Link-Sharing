package linksharing

class Resource1 {

    String description
    User1 createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated
    static hasMany = [readingItem:ReadingItem,resourceRated:ResourceRating]
    static belongsTo = [topic:Topic,createdBy:User1]
    static constraints = {
        description nullable:true,size:1..100

    }
}

class LinkResource extends Resource1 {
    String url
}

class DocumentResource extends Resource1 {
    String filePath
}
