package newlinksharingapp

import grails.transaction.Transactional

@Transactional
class ReadingService {

    def displayUnread(String email) {
        Long id = Users.findByEmail(email).id
        List<Long> Verys = Subscription.createCriteria().list {
            projections {
                property("topic")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.VERY_SERIOUS)
        }.collect { it.id }

        List<Long> Ser = Subscription.createCriteria().list {
            projections {
                property("topic")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.SERIOUS)
        }.collect { it.id }
        List<Long> Cas = Subscription.createCriteria().list {
            projections {
                property("topic")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.CASUAL)
        }.collect { it.id }
        List<Resources> Verysr
        List<Resources> Serr
        List<Resources> Casr
        if (Verys) {
            Verysr = ReadingItem.createCriteria().list {
                projections {
                    property("resource")
                }
                'resource' {
                    inList("topic.id", Verys)
                }
                eq("user.id", id)
                eq("isRead", false)
            }
        }
        if (Ser) {
            Serr = ReadingItem.createCriteria().list {
                projections {
                    property("resource")
                }
                eq("user.id", id)
                'resource' {
                    inList("topic.id", Ser)
                }
                eq("isRead", false)
            }
        }
        if (Cas) {
            Casr = ReadingItem.createCriteria().list {
                projections {
                    property("resource")
                }
                'resource' {
                    inList("topic.id", Cas)
                }
                eq("user.id", id)
                eq("isRead", false)
            }
        }

        ArrayList<Resources> resources = new ArrayList()
        Verysr.each {
            resources.add(it)
        }
        Serr.each {
            resources.add(it)
        }
        Casr.each {
            resources.add(it)
        }
        return resources
    }


    def editReadMethod(identifier, email) {
        Long valueHere = Long.parseLong(identifier)
        Users user = Users.findByEmail(email)
        ReadingItem readItem = checkIfRead(valueHere, user)
        readItem.isRead = true
        readItem.save(flush: true)
    }

    private ReadingItem checkIfRead(long valueHere, user) {
        ReadingItem readItem = ReadingItem.createCriteria().get {
            eq('resource.id', valueHere)
            eq('user.id', user.id)
        }
        readItem
    }

    def deleteMethod(params) {
        Resources res = Resources.get(Long.parseLong(params.id))
        res.delete()
    }

}
