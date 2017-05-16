//
//  Cat.swift
//  cat-api
//
//  Created by Louis Tur on 5/16/17.
//
//

import Foundation
import Vapor
import HTTP

class Cat: NodeRepresentable, JSONRepresentable, ResponseRepresentable {
  let name: String!
  let breed: String!
  let favoriteSnack: String!
  
  init(name: String, breed: String, snack: String) {
    self.name = name
    self.breed = breed
    self.favoriteSnack = snack
  }
  
  // NodeRepresentable has two required functions
  // makeNode() throws -> Node
  // makeNode(context:) throws -> Node
  func makeNode() throws -> Node {
    return try Node(node: ["name": self.name,
                           "breed": self.breed,
                           "favoriteSnack": self.favoriteSnack,
                           "age": 5])
  }
  
  func makeNode(context: Context) throws -> Node {
    return try self.makeNode()
  }
  
  // JSONRepresentable requires a single function 
  // makeJSON() throws -> JSON
  // But fortunately, Vapor already has an extension that 
  // provides a default implementation for makeJSON() for
  // cases where Self is of type NodeRepresentable. 
  // This means we don't have to provide our own makeJSON() 
  // method if the extension satisfies our needs
  
  // ResponseRepresentable requires a single function
  // makeResponse() throws -> Response
  func makeResponse() throws -> Response {
    return try self.makeJSON().makeResponse()
  }
  
}
