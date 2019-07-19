package linksharing

class LinkResource extends Resources {

    String linkUrl

    static constraints = {
        linkUrl(blank: false, url: true)
    }

    String toString() {
        return linkUrl
    }
}