//
//  User.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 26/05/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation
import JSONJoy

struct User: JSONJoy {
  let ID: Int!
  var firstName: String!
  var lastName: String!
  var token: String?

  init(_ decoder: JSONDecoder) throws {
    ID = try decoder["id"].getInt()
    firstName = try decoder["first_name"].getString()
    lastName = try decoder["last_name"].getString()
  }
}