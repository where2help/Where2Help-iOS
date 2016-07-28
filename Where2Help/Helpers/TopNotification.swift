//
//  TopNotification.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 14/07/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import UIKit
import RADInfoBannerView

struct TopNotification {
  static func showError(controller: UIViewController, message: String) {
    let infoBannerView = RADInfoBannerView(text: message, showActivityIndicatorView: false)
    infoBannerView.backgroundColor = .redColor()
    infoBannerView.show(inController: controller).hide(afterDelay: 3.0)
  }

  static func showSuccess(controller: UIViewController, message: String) {
    let infoBannerView = RADInfoBannerView(text: message, showActivityIndicatorView: false)
    infoBannerView.backgroundColor = Theme.optInColor()
    infoBannerView.show(inController: controller).hide(afterDelay: 3.0)
  }

  static func showLoading(controller: UIViewController, message: String) {
    let infoBannerView = RADInfoBannerView(text: message, showActivityIndicatorView: true)
    infoBannerView.show(inController: controller)
  }

  static func hideNotifications(controller: UIViewController) {
    RADInfoBannerView.hideAllInfoBannerView(inController: controller, animated: true)
  }
}