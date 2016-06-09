//
//  LandingPageViewController.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 09/06/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

  override func viewWillAppear(animated: Bool) {
    if let credentials : [String : String] = UserManager.loadUserCredentialsIfPersisted() {
      if let email = credentials["email"], password = credentials["password"] {
        activityIndicator.startAnimating()
        APIClient.login(email, password: password,
                        success: { (user: User) -> Void in
                          self.activityIndicator.stopAnimating()
                          self.performSegueWithIdentifier("UserPersistedAndSignedIn", sender: self)
          },
                        failure: { (message: String) -> Void in
                          self.activityIndicator.stopAnimating()
          }
        )
      }
    }
  }
}