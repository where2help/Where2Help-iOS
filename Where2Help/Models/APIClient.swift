//
//  APIClient.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 26/05/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation
import Alamofire

struct APIClient {
  static func login(email: String, password: String, success:(user: User) -> Void, failure:(message: String) -> Void) {
    let params = [
      "email": email,
      "password": password
    ]
    Alamofire.request(.POST, "\(Constants.Where2HelpAPIUrl)/users/login", parameters: params)
      .validate(statusCode: 200..<300)
      .responseJSON { response in
        switch response.result {
        case .Success:
          if let JSON = response.result.value {
            if let user = UserMapper.map(JSON as! NSDictionary), token = response.response?.allHeaderFields["TOKEN"] {
              updateTokenForUser(user, token: token as! String)
              success(user: user)
            }
          }
        case .Failure(_):
          if let statusCode = response.response?.statusCode {
            switch statusCode {
            case 404:
              failure(message: "User email \(email) not found.")
            case 401:
              failure(message: "Incorrect email/password combination.")
            case 403:
              failure(message: "Please confirm your email address!")
            default:
              failure(message: "Could not sign you in right now. Please try again later")
            }
          }
        }
    }
    print("Signing in with email: \(email) password: \(password)")
  }

  static func getEvents(user: User, success:(json: NSArray) -> Void, failure:(message: String) -> Void) {
    let headers = headerForUser(user)

    Alamofire.request(.GET, "\(Constants.Where2HelpAPIUrl)/events", headers: headers)
      .validate(statusCode: 200..<300)
      .responseJSON { response in
        if let token = response.response?.allHeaderFields["TOKEN"] {
          updateTokenForUser(user, token: token as! String)
          switch response.result {
          case .Success:
            if let JSON : NSArray = response.result.value as? NSArray {
              success(json: JSON)
            }
          case .Failure(_):
            failure(message: "BAD")
          }
        }
    }

    return
  }

  private static func headerForUser(user: User) -> [String:String] {
    if let token = user.token {
      return [
        "Authorization": "Token token=\(token)"
      ]
    }
    return [:]
  }

  private static func updateTokenForUser(user: User, token: String) {
    user.token = token
  }
}
