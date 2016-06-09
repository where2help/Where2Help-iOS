//
//  UserManager.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 09/06/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation

class UserManager {

  struct Static {
    static var currentUser: User?
  }

  class var currentUser: User? {
    return Static.currentUser
  }

  class func userSignedIn(user: User) {
    Static.currentUser = user
  }
}