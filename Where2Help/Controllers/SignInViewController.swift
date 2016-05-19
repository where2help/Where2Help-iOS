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

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    if textField == emailTextField {
      passwordTextField.becomeFirstResponder()
    } else {
      signIn()
    }
    return true
  }

  @IBAction func signInButtonTapped(sender: UIButton) {
    signIn()
  }

  func signIn() {
    let emailAddress = emailTextField.text
    let password = passwordTextField.text
    print("Signing in with email: \(emailAddress) password: \(password)")
  }
}