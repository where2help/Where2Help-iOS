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


  @IBAction func signUpButtonTapped(sender: UIButton) {
  }

  @IBAction func termsSwitchValueChanged(sender: UISwitch) {
  }
}
