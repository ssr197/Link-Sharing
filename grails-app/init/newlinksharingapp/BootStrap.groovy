package newlinksharingapp

class BootStrap {

    def init = { servletContext ->
/*

        Users user1 = new Users(firstName:"Saurabh",lastName: "Kumar",email: "saurabh@kumar.com",username: "saurabhkumar",password: "123",admin:false,active:true)
        Users user2 = new Users(firstName:"z",lastName: "z",email: "z@z.com",username: "z",password: "123",admin:false,active:true)

        Topics topic1 = new Topics(name:"Grails",visibility: "PUBLIC")
        Topics topic2 = new Topics(name:"Groovy",visibility: "PUBLIC")
        Topics topic3 = new Topics(name:"HTML",visibility: "PUBLIC")

        user1.addToTopicsCreated(topic1)
        user1.save(flush:true,failOnError: true)
        topic1.save(flush:true,failOnError: true)
        user1.addToTopicsCreated(topic2)
        user1.save(flush:true,failOnError: true)
        topic2.save(flush:true,failOnError: true)

        user2.addToTopicsCreated(topic3)
        user2.save(flush:true,failOnError: true)
        topic3.save(flush:true,failOnError: true)

        Resources resource1 = new Resources(description:"This is first Post",topic:topic1)
        Resources resource2 = new Resources(description:"This is second Post",topic:topic1)
        Resources resource3 = new Resources(description:"This is third Post",topic:topic2)
        Resources resource4 = new Resources(description:"This is fourth Post",topic:topic3)

        user1.addToResourcescreated(resource1)
        user1.save(flush:true,failOnError: true)
        user1.addToResourcescreated(resource2)
        user1.save(flush:true,failOnError: true)
        user2.addToResourcescreated(resource3)
        user2.save(flush:true,failOnError: true)
        user2.addToResourcescreated(resource4)
        user2.save(flush:true,failOnError: true)

        topic1.addToResourcesHas(resource1)
        topic1.save(flush:true,failOnError:true)
        topic1.addToResourcesHas(resource2)
        topic1.save(flush:true,failOnError:true)
        topic2.addToResourcesHas(resource3)
        topic2.save(flush:true,failOnError:true)
        topic3.addToResourcesHas(resource4)
        topic3.save(flush:true,failOnError:true)

        resource1.save(flush:true,failOnError:true)
        resource2.save(flush:true,failOnError:true)
        resource3.save(flush:true,failOnError:true)
        resource4.save(flush:true,failOnError:true)*/
    }
    def destroy = {
    }
}
