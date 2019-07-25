package newlinksharingapp

class Resources {

    String description
    Users createdBy
    Topics topic
    Date dateCreated
    Date lastUpdated

    static hasMany = [readingItem:ReadingItem,resourceRated:ResourcesRating]
    static belongsTo = [topic:Topics,createdBy:Users]
    static constraints = {
        description nullable:true,size:1..100
    }
}

class LinkResource extends Resources {
    String url
}


class DocumentResource extends Resources {
    String filePath
}
