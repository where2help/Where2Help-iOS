//
//  SignInViewController.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 19/05/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import UIKit
import Alamofire

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
    let emailAddress = emailTextField.text!
    let password = passwordTextField.text!
    let params = [
      "email": emailAddress,
      "password": password
    ]
    Alamofire.request(.POST, "\(Constants.Where2HelpAPIUrl)/users/login", parameters: params)
      .validate(statusCode: 200..<300)
      .responseJSON { response in
      print(response.request)  // original URL request
      print(response.response) // URL response
      print(response.data)     // server data
      print(response.result)   // result of response serialization

      if let JSON = response.result.value {
        if response.result.isSuccess {
          self.performSegueWithIdentifier("SignInSuccessful", sender: self)
        }
        print("JSON: \(JSON)")
      }
    }
    print("Signing in with email: \(emailAddress) password: \(password)")
  }
}