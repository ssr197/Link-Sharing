package newlinksharingapp

class BootStrap {

    def init = { servletContext ->
/*

        //    this code will add some some data to every table in databas. Commented because
        Users u1=new Users(username : 'Shalin' , firstName : 'Shalin'  , lastName : 'Prasad' , password : '123' , admin : false , active : true , email : 'shalinprasad24@gmail.com' )
        Users u2=new Users(username : 'Rishabh' , firstName : 'Rishabh'  , lastName : 'Gupta' , password : '123' , admin : false , active : true , email : 'rishabh@gmail.com')
        Users u3=new Users(username : 'Chaithra' , firstName : 'Chaithra'  , lastName : 'G S' , password : '123' , admin : false , active : true , email : 'chaithra@gmail.com')
        Users u4=new Users(username : 'Saurabh' , firstName : 'Saurabh'  , lastName : 'Kumar' , password : '123' , admin : true  , active : true , email : 'saurabh50197@gmail.com')

        u1.save(flush:true,failOnError:true)

        Topics topic1 = new Topics(name:"Noida",visibility: "PUBLIC")
        Topics topic2 = new Topics(name:"NCR",visibility: "PUBLIC")
        Topics topic3 = new Topics(name:"Bangalore",visibility: "PUBLIC")
        Topics topic11 = new Topics(name:"Mumbai",visibility: "PRIVATE")
        Topics topic12 = new Topics(name:"Hydrabad",visibility: "PRIVATE")

        u4.addToTopic(topic1)
        u4.addToTopic(topic2)
        u4.save(flush:true,failOnError: true)
        topic1.save(flush:true,failOnError: true)
        topic2.save(flush:true,failOnError: true)

        u3.addToTopic(topic3)
        u3.addToTopic(topic11)
        u3.save(flush:true,failOnError: true)
        topic3.save(flush:true,failOnError: true)
        topic11.save(flush:true,failOnError: true)

        u2.addToTopic(topic12)
        u2.save(flush:true,failOnError: true)
        topic12.save(flush:true,failOnError: true)

        Resources resource1 = new Resources(description:"Resource-1 and some random texts here",topic:topic1)
        Resources resource2 = new Resources(description:"Resource-2 and some random texts here",topic:topic1)
        Resources resource3 = new Resources(description:"Resource-3 and some random texts here",topic:topic2)
        Resources resource4 = new Resources(description:"Resource-4 and some random texts here",topic:topic3)
        u4.addToResource(resource1)

        u4.addToResource(resource2)

        u4.addToResource(resource3)
        u4.save(flush:true,failOnError: true)

        u3.addToResource(resource4)
        u3.save(flush:true,failOnError: true)

        topic1.addToResource(resource1)

        topic1.addToResource(resource2)
        topic1.save(flush:true,failOnError: true)

        topic2.addToResource(resource3)
        topic2.save(flush:true,failOnError: true)

        topic3.addToResource(resource4)
        topic3.save(flush:true,failOnError: true)
        resource1.save(flush:true,failOnError:true)
        resource2.save(flush:true,failOnError:true)
        resource3.save(flush:true,failOnError:true)
        resource4.save(flush:true,failOnError:true)
        Subscription s1=new Subscription(seriousness: "CASUAL" ,topic :topic1)
        Subscription s2=new Subscription(seriousness: "CASUAL" , topic : topic2)
        Subscription s3=new Subscription(seriousness: "CASUAL" , topic : topic3)
        Subscription s4=new Subscription(seriousness: "CASUAL" , topic : topic11)
        Subscription s5=new Subscription(seriousness: "CASUAL" , topic: topic12)
        Subscription subs=new Subscription(seriousness: "CASUAL" ,topic:topic11)
        Subscription sub=new Subscription(seriousness: "CASUAL" , topic :topic1)
        Subscription su=new Subscription(seriousness: "CASUAL" , topic :topic2)

        u4.addToSubscribedTo(s1)
        u4.addToSubscribedTo(s2)
        u4.addToSubscribedTo(subs)
        u3.addToSubscribedTo(s3)
        u3.addToSubscribedTo(s4)
        u2.addToSubscribedTo(s5)
        u1.addToSubscribedTo(sub)
        u1.addToSubscribedTo(su)

        topic1.addToSubscribedTo(s1)
        topic1.addToSubscribedTo(sub)
        topic2.addToSubscribedTo(su)
        topic2.addToSubscribedTo(s2)
        topic3.addToSubscribedTo(s3)
        topic11.addToSubscribedTo(s4)
        topic11.addToSubscribedTo(subs)
        topic12.addToSubscribedTo(s5)

        s1.save(flush:true,failOnError:true)
        s2.save(flush:true,failOnError:true)
        s3.save(flush:true,failOnError:true)
        s4.save(flush:true,failOnError:true)
        s5.save(flush:true,failOnError:true)
        subs.save(flush:true,failOnError:true)
        sub.save(flush:true,failOnError:true)
        su.save(flush:true,failOnError:true)
*/

        //This is another part of the same
        Users u1=new Users(username : 'Shalin' , firstName : 'Shalin'  , lastName : 'Prasad' , password : '123' , admin : false , active : true , email : 'shalinprasad24@gmail.com' )
        Users u2=new Users(username : 'Rishabh' , firstName : 'Rishabh'  , lastName : 'Gupta' , password : '123' , admin : false , active : true , email : 'rishabh@gmail.com')
        Users u3=new Users(username : 'Chaithra' , firstName : 'Chaithra'  , lastName : 'G S' , password : '123' , admin : false , active : true , email : 'chaithra@gmail.com')
        Users u4=new Users(username : 'Saurabh' , firstName : 'Saurabh'  , lastName : 'Kumar' , password : '123' , admin : true  , active : true , email : 'saurabh50197@gmail.com')

        u1.save(flush:true,failOnError:true)

        Topics topic1 = new Topics(name:"Noida",visibility: "PUBLIC")
        Topics topic2 = new Topics(name:"NCR",visibility: "PUBLIC")
        Topics topic3 = new Topics(name:"Bangalore",visibility: "PUBLIC")
        Topics topic11 = new Topics(name:"Mumbai",visibility: "PRIVATE")
        Topics topic12 = new Topics(name:"Hydrabad",visibility: "PRIVATE")

        u4.addToTopic(topic1)
        u4.addToTopic(topic2)
        u4.save(flush:true,failOnError: true)
        topic1.save(flush:true,failOnError: true)
        topic2.save(flush:true,failOnError: true)

        u3.addToTopic(topic3)
        u3.addToTopic(topic11)
        u3.save(flush:true,failOnError: true)
        topic3.save(flush:true,failOnError: true)
        topic11.save(flush:true,failOnError: true)

        u2.addToTopic(topic12)
        u2.save(flush:true,failOnError: true)
        topic12.save(flush:true,failOnError: true)

        LinkResource resource1 = new LinkResource(description:"facebook link-1 as description.",topic:topic1, url: "https//:www.facebook.com")
        LinkResource resource2 = new LinkResource(description:"facebook link-2 as description.",topic:topic1, url: "https//:www.facebook.com")
        LinkResource resource3 = new LinkResource(description:"facebook link-3 as description.",topic:topic2, url: "https//:www.facebook.com")
        LinkResource resource4 = new LinkResource(description:"facebook link-4 as description.",topic:topic3, url: "https//:www.facebook.com")

        u4.addToResource(resource1)
        u4.addToResource(resource2)
        u4.addToResource(resource3)
        u4.save(flush:true,failOnError: true)

        u3.addToResource(resource4)
        u3.save(flush:true,failOnError: true)

        topic1.addToResource(resource1)

        topic1.addToResource(resource2)
        topic1.save(flush:true,failOnError: true)

        topic2.addToResource(resource3)
        topic2.save(flush:true,failOnError: true)

        topic3.addToResource(resource4)
        topic3.save(flush:true,failOnError: true)
        resource1.save(flush:true,failOnError:true)
        resource2.save(flush:true,failOnError:true)
        resource3.save(flush:true,failOnError:true)
        resource4.save(flush:true,failOnError:true)
        Subscription s1=new Subscription(seriousness: "CASUAL" ,topic :topic1)
        Subscription s2=new Subscription(seriousness: "CASUAL" , topic : topic2)
        Subscription s3=new Subscription(seriousness: "CASUAL" , topic : topic3)
        Subscription s4=new Subscription(seriousness: "CASUAL" , topic : topic11)
        Subscription s5=new Subscription(seriousness: "CASUAL" , topic: topic12)
        Subscription subs=new Subscription(seriousness: "CASUAL" ,topic:topic11)
        Subscription sub=new Subscription(seriousness: "CASUAL" , topic :topic1)
        Subscription su=new Subscription(seriousness: "CASUAL" , topic :topic2)

        u4.addToSubscribedTo(s1)
        u4.addToSubscribedTo(s2)
        u4.addToSubscribedTo(subs)
        u3.addToSubscribedTo(s3)
        u3.addToSubscribedTo(s4)
        u2.addToSubscribedTo(s5)
        u1.addToSubscribedTo(sub)
        u1.addToSubscribedTo(su)

        topic1.addToSubscribedTo(s1)
        topic1.addToSubscribedTo(sub)
        topic2.addToSubscribedTo(su)
        topic2.addToSubscribedTo(s2)
        topic3.addToSubscribedTo(s3)
        topic11.addToSubscribedTo(s4)
        topic11.addToSubscribedTo(subs)
        topic12.addToSubscribedTo(s5)

        s1.save(flush:true,failOnError:true)
        s2.save(flush:true,failOnError:true)
        s3.save(flush:true,failOnError:true)
        s4.save(flush:true,failOnError:true)
        s5.save(flush:true,failOnError:true)
        subs.save(flush:true,failOnError:true)
        sub.save(flush:true,failOnError:true)
        su.save(flush:true,failOnError:true)
    }

    def destroy = {
    }
}
