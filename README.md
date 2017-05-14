# Server Side Swift w/ Vapor
An intro to Server Side Swift using Vapor
---

### Pre-Requisites
1. [Installing Vapor](https://vapor.github.io/documentation/getting-started/install-toolbox.html)
2. [Installing Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)

### Readings
1. [Hello, World! Vapor Tut](https://vapor.github.io/documentation/getting-started/hello-world.html)
3. [Vapor Folder Structure](https://vapor.github.io/documentation/guide/folder-structure.html)
4. [Basic Routing](https://vapor.github.io/documentation/routing/basic.html)
5. [Request Object](https://vapor.github.io/documentation/http/request.html)

### Reference
1. [Vapor Community](https://github.com/vapor-community)
2. [Vapor Documentation](https://vapor.github.io/documentation/)
3. [Swift Modules](https://swift.org/package-manager/)

### Examples of Server Side Swift
1. [NSDateFormatter - Code](https://github.com/subdigital/nsdateformatter.com)
2. [NSDateFormatter - Site](http://nsdateformatter.com/)
3. [NSURL - Code](https://github.com/tnantoka/NSURL)
3. [NSURL - Site](http://nsurl.serversideswift.net/)
4. [String Filter - Code](https://github.com/tnantoka/StringFilterExample)
5. [String Filter - Site](https://stringfilter.herokuapp.com/)

### Advanced
1. [How to Run Vapor with Docker in Heroku](https://gist.github.com/alexaubry/bea6f9b626e71b48ae6065664748bc97)

---
## Vapor
### What is it?

An open source, server side Swift framework. It will allow you to write web apps and RESTful API's using the language you already know and love. 


### Why learn it?

1. Not many people know it (marketable)
2. It's impressive (unique skill)
3. You can create your own backend (!!!!!)
4. You can create web apps (!)

---
## Starting off 

Once you have Vapor installed on your machine, you can create a new Vapor project from a default template by running 

```vapor new <project-name>```

![vapor new <project-name>](./Images/vapor_new.png)
![vapor ascii logo](./Images/vapor_ascii.png)

This will create a new project in your current directory. Out of the box, the vapor template is just a Swift module template with libraries specifically used by Vapor (see [Folder Structure](https://vapor.github.io/documentation/guide/folder-structure.html)). To actually start working with it inside our IDE, Xcode, we need to run one more command in the root of the project:

```vapor xcode -y```

![vapor xcode](./Images/vapor_xcode.png)

Running this command will not only create the Xcode project, but it will also build the dependancies needed for our project (more on this later). This stage will take a little bit of time to perform as Vapor will be fetching dependancies. The `-y` parameter will have Vapor automatically open the xcode project after building it. 

With XCode open, switch your schema to use the executable *App* schema (denoted by a little terminal window icon) on *My Mac* and **Build** the project. 

![Run the Executable App Target > My Mac Schema](./Images/xcode_schema.png)

You should now be able to **Run** the project. Doing so will launch a local server on your Mac. To verify, go to 

```localhost:8080```

You should see a simple message from Vapor. 

![It works - Vapor](./Images/vapor_localhost.png)

And that's it for getting up your environment started!

--
## Making Requests - GET


