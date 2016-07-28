//
//  RegistrationViewController.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 30/06/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var passwordConfirmTextField: UITextField!
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var phoneNumberTextField: UITextField!
  @IBOutlet weak var signUpButton: UIButton!
  var termsAccepted: Bool = false

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    termsAccepted = false
    signUpButton.enabled = termsAccepted
    for textField in [emailTextField, passwordTextField, passwordConfirmTextField, firstNameTextField, lastNameTextField, phoneNumberTextField] {
      textField.delegate = self
    }
  }

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }

  @IBAction func signUpButtonTapped(sender: UIButton) {
    if let email = emailTextField.text, password = passwordTextField.text,
    passwordConfirm = passwordConfirmTextField.text, firstName = firstNameTextField.text,
    lastName = lastNameTextField.text, phoneNumber = phoneNumberTextField.text {
      APIClient.signUp(email, password: password, passwordConfirm: passwordConfirm, firstName: firstName, lastName: lastName, phoneNumber: phoneNumber,
         success: { (message) in
          self.performSegueWithIdentifier("SignUpSuccessful", sender: message)
        },
         failure: { (message) in
          TopNotification.showError(self, message: message)
      })
    }
  }

  @IBAction func termsSwitchValueChanged(sender: UISwitch) {
    termsAccepted = sender.on
    signUpButton.enabled = termsAccepted
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SignUpSuccessful" {
      if let destinationVC = segue.destinationViewController as? LandingPageViewController {
        if let message: String = sender as? String {
          destinationVC.registrationMessage = message
        }
      }
    }
  }
}
