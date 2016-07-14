//
//  TopNotification.swift
//  Where2Help
//
//  Created by Ramon Huidobro on 14/07/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import UIKit
import GTNotification

struct TopNotification {
  static func showError(message: String) {
    let notification = notificationWithMessage(message)
    notification.backgroundColor = Theme.optOutColor()
    notification.tintColor = .whiteColor()
    GTNotificationManager.sharedInstance.showNotification(notification)
  }

  static func showSuccess(message: String) {
    let notification = notificationWithMessage(message)
    notification.backgroundColor = Theme.optInColor()
    notification.tintColor = .whiteColor()
    GTNotificationManager.sharedInstance.showNotification(notification)
  }

  static private func notificationWithMessage(message: String) -> GTNotification {
    let notification: GTNotification = GTNotification()
    notification.message = message
    notification.animation = GTNotificationAnimation.Slide
    return notification
  }
}