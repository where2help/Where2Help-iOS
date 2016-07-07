//
//  LandingPageViewController.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 09/06/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {

  override func viewWillAppear(animated: Bool) {
    if let credentials : [String : String] = UserManager.loadUserCredentialsIfPersisted() {
      if let email = credentials["email"], password = credentials["password"] {
        APIClient.login(email, password: password,
                        success: { (user: User) -> Void in
                          self.performSegueWithIdentifier("UserPersistedAndSignedIn", sender: self)
          },
                        failure: { (message: String) -> Void in
          }
        )
      }
    }
  }
}