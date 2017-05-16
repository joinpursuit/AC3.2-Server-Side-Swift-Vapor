import Vapor
import HTTP

let drop = Droplet()

drop.get() { (request: Request) in
  return "Hey! Its the cat api!"
}

// localhost:8080/all-cats
drop.get("all-cats") { (request: Request) in
  return "Where are all the kitties?"
}

// /all-cats
drop.group("all-cats") { group in
  
  // appends /calicos
  group.get("calicos") { (request: Request) in
    return "D*mn, I've got sooooo many calicos!"
  }

  // appends /american-shorthair
  group.get("american-shorthair") { (request: Request) in
    return "The hairs! theyre so short!!"
  }
  
  // /all-cats/cute
  group.group("cute") { grp in
    
    // /all-cats/cute/kittens
    grp.get("kittens") { request in
      return "CUTE KITTENS IN A GROUP"
    }
    
  }

}

// /all-cats/calicos/cute
drop.get("all-cats", "calicos", "cute") { (request: Request) in
  return "LOOK AT THE CUTIES CALICOS"
}

// MARK - Errors!
drop.get("cat-error") { (request: Request) in
  throw Abort.badRequest
}

drop.get("custom-error") { (request: Request) in
  throw Abort.custom(status: .imATeapot, message: "Short and Stout!")
}

// MARK: Return Actual JSON
drop.get("cat-json") { (request: Request) in
  return try JSON(node: ["cat_names" : ["Miley", "Mittens", "Garfield"]])
}





// MARK: Parameterized Calls 
drop.get("all-cats-int", Int.self) { (request: Request, breedID: Int) in
  return "The Call Breed Request is: \(breedID)"
}

drop.get("all-cats-string", ":cat-breed") { (request: Request) in
  
  // (key: cat-breed, value: ??)
  // inspect properties of request to find { "cat-breed" : <some value> }
  guard let catBreed = request.parameters["cat-breed"]?.string else {
    throw Abort.badRequest
  }
  
  return "The cat breed (string) is \(catBreed)"
}


// MARK: Node Endpoint
drop.get("cat-node") { request in
  
  let newCat = Cat(name: "Miley", breed: "American Shorthair", snack: "Salmon")
//  let catJSON = try newCat.makeNode()
//  let catJSON = try newCat.makeJSON()
//  return try newCat.makeJSON() // catJSON
  
  // .makeReponse() call returns type Response with is a HTTPURLResponse
  return try newCat.makeResponse()
}

// MARK: POST
drop.post("log-cat") { request in
  // what in request would contain our HTTPBody info that we're passing in from Postman?
  
  guard let cat = request.json?["name"]?.string else {
    throw Abort.custom(status: .badRequest, message: "Request did not have key: name")
  }
  
  // 1. Finish the post request by filling out the rest of the keys needed to make a Cat
  //  - create an instance of Cat
  //  - have a return response to let a user know that their post was successful
  
  // 2. Modify the post request to send in an array and/or dict of Cats json
  //  - change how you parse the cats
  //  - create the array of new Cat objects
  //  - have a return response to let a user know that their post was successful
  
  return "You're posting a kitten: \(cat)"
}




drop.run()
