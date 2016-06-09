//
//  User.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 26/05/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation
import JSONJoy

class User: JSONJoy {
  let ID: Int!
  var firstName: String!
  var lastName: String!
  var token: String?
  var password: String?
  var email: String?

  required init(_ decoder: JSONDecoder) throws {
    ID = try decoder["id"].getInt()
    firstName = try decoder["first_name"].getString()
    lastName = try decoder["last_name"].getString()
  }
}

class UserMapper {
  class func map(data: NSDictionary) -> User? {
    let decoder = JSONDecoder(data)
    var user : User
    do {
      try user = User(decoder)
    } catch {
      print("unable to parse the JSON")
      return nil
    }
    return user
  }
}