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
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

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
        showError("Please make sure to fill in your email and password!")
        return
      }
      let params = [
        "email": emailAddress,
        "password": password
      ]
//      actInd.hidesWhenStopped = true
      activityIndicator.startAnimating()
      Alamofire.request(.POST, "\(Constants.Where2HelpAPIUrl)/users/login", parameters: params)
        .validate(statusCode: 200..<300)
        .responseJSON { response in
          switch response.result {
          case .Success:
            if let JSON = response.result.value {
              self.performSegueWithIdentifier("SignInSuccessful", sender: self)
              print("JSON: \(JSON)")
            }
          case .Failure(_):
            if let statusCode = response.response?.statusCode {
              switch statusCode {
              case 404:
                self.showError("User email \(emailAddress) not found.")
              case 401:
                self.showError("Incorrect email/password combination.")
              case 403:
                self.showError("Please confirm your email address!")
              default:
                self.showError("Could not sign you in right now. Please try again later")
              }
            }
          }
        self.activityIndicator.stopAnimating()
      }
      print("Signing in with email: \(emailAddress) password: \(password)")
    }
  }

  func showError(message: String) {
    errorLabel.hidden = false
    errorLabel.text = message
    errorLabel.sizeToFit()
  }
}