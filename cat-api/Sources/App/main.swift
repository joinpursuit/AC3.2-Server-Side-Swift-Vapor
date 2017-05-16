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
  let catNode = try newCat.makeNode()

  return "The cat: \(catNode)"
}


drop.run()
