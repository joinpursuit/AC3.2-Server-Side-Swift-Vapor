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

class Cat: NodeRepresentable {
  let name: String!
  let breed: String!
  let favoriteSnack: String!
  
  init(name: String, breed: String, snack: String) {
    self.name = name
    self.breed = breed
    self.favoriteSnack = snack
  }
  
  func makeNode() throws -> Node {
    return try Node(node: ["name": self.name,
                           "breed": self.breed,
                           "favoriteSnack": self.favoriteSnack,
                           "age": 5])
  }
  
  func makeNode(context: Context) throws -> Node {
    return try self.makeNode()
  }
}
