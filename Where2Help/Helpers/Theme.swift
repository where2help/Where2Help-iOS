//
//  Theme.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 16/06/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import UIKit

struct Theme {
  static func optInColor() -> UIColor {
    return UIColor(red:0.23, green:0.69, blue:0.85, alpha:1.0)
  }

  static func optOutColor() -> UIColor {
    return UIColor(red:0.85, green:0.27, blue:0.33, alpha:1.0)
  }

  static func availableColor() -> UIColor {
    return UIColor(white: 0.55, alpha: 1.0)
  }

  static func youreInColor() -> UIColor {
    return UIColor(red:0.55, green:0.76, blue:0.32, alpha:1.0)
  }
}