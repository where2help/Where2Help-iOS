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

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
  }

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }

  @IBAction func signInButtonTapped(sender: UIButton) {
    signIn()
  }

  func signIn() {
    if let emailAddress = emailTextField.text, password = passwordTextField.text {
      if emailAddress.isEmpty || password.isEmpty {
        TopNotification.showError("Please make sure to fill in your email and password!")
        return
      }
      APIClient.login(emailAddress, password: password,
        success: { (user: User) -> Void in
          self.performSegueWithIdentifier("SignInSuccessful", sender: self)
        },
        failure: { (message: String) -> Void in
          TopNotification.showError(message)
        }
      )
    }
  }
}