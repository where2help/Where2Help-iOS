//
//  SignInViewController.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 19/05/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

  var user : User?

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    errorLabel.hidden = true
  }

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    if textField == emailTextField {
      passwordTextField.becomeFirstResponder()
    } else {
      textField.resignFirstResponder()
      signIn()
    }
    return true
  }

  @IBAction func signInButtonTapped(sender: UIButton) {
    signIn()
  }

  func signIn() {
    if let emailAddress = emailTextField.text, password = passwordTextField.text {
      if emailAddress.isEmpty || password.isEmpty {
        self.showError("Please make sure to fill in your email and password!")
        return
      }
      activityIndicator.startAnimating()
      APIClient.login(emailAddress, password: password,
        success: { (user: User) -> Void in
          self.activityIndicator.stopAnimating()
          self.user = user
          self.performSegueWithIdentifier("SignInSuccessful", sender: self)
        },
        failure: { (message: String) -> Void in
          self.activityIndicator.stopAnimating()
          self.showError(message)
        }
      )
      activityIndicator.startAnimating()
    }
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SignInSuccessful" {
      if let tabController : UITabBarController = segue.destinationViewController as? UITabBarController {
        print(tabController.viewControllers!)
        if let navController : UINavigationController = tabController.viewControllers?.first as? UINavigationController {
          if let eventsController : EventsViewController = navController.topViewController as? EventsViewController {
            eventsController.user = self.user!
          }
        }
      }
    }
  }

  func showError(message: String) {
    errorLabel.hidden = false
    errorLabel.text = message
    errorLabel.sizeToFit()
  }
}