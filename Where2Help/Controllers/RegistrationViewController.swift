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
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
}
