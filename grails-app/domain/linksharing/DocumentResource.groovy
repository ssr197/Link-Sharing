package linksharing

class DocumentResource extends Resources{
    String documentPath

    static constraints={
        documentPath nullable: true, blank: false
    }
}
