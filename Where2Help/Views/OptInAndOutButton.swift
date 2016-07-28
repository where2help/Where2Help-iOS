//
//  OptInAndOutButton.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 16/06/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import UIKit

class OptInAndOutButton : UIButton {

  let activityIndicator = UIActivityIndicatorView(frame: CGRectMake(25, 25, 50, 50))

  func optedIn() {
    activityIndicator.removeFromSuperview()
    setTitle("Absagen", forState: UIControlState.Normal)
    backgroundColor = Theme.optOutColor()
  }

  func optedOut() {
    activityIndicator.removeFromSuperview()
    setTitle("Helfen", forState: UIControlState.Normal)
    backgroundColor = Theme.optInColor()
  }

  func showLoading() {
    activityIndicator.backgroundColor = .clearColor()
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
    activityIndicator.startAnimating()
    activityIndicator.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)
    self.addSubview(activityIndicator)
    setTitle("", forState: UIControlState.Normal)
    self.setNeedsDisplay()
  }
}
