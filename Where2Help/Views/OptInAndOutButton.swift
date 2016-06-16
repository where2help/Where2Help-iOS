//
//  OptInAndOutButton.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 16/06/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import UIKit

class OptInAndOutButton : UIButton {

  func optedIn() {
    setTitle("Absagen", forState: UIControlState.Normal)
    backgroundColor = Theme.optOutColor()
  }

  func optedOut() {
    setTitle("Helfen", forState: UIControlState.Normal)
    backgroundColor = Theme.optInColor()
  }
}
