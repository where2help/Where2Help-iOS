//
//  UserManager.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 09/06/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation
import Locksmith

class UserManager {

  struct Static {
    static var currentUser: User?
  }

  class var currentUser: User? {
    return Static.currentUser
  }

  class func userSignedIn(user: User) {
    Static.currentUser = user
    persistUser(user)
  }

  class func loadUserCredentialsIfPersisted() -> [String: String]? {
    let defaults = NSUserDefaults.standardUserDefaults()
    if let email : String = defaults.objectForKey("email") as? String {
      do {
        if let dictionary = Locksmith.loadDataForUserAccount(email) {
          if let password : String = dictionary["password"] as? String {
            return ["email": email, "password": password]
          }
        }
      }
    }
    return [:]
  }

  class func logOut() {
    do {
      if let user = currentUser, email = user.email {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey(email)
        try Locksmith.deleteDataForUserAccount(email)
        Static.currentUser = nil
      }
    }
    catch {
      print("Could not log out user")
    }
  }

  private class func persistUser(user: User) {
    do {
      if let email: String = user.email, password: String = user.password {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(email, forKey: "email")
        try Locksmith.saveData(["password": password], forUserAccount: email)
      }
    }
    catch {
      print("Could not persist user")
    }
  }
}