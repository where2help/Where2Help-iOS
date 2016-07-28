//
//  ShiftDetailInteractor.swift
//  Where2Help
//
//  Created by Aaron Cruz on 4/8/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation

class ShiftDetailInteractor {
  var handler: ShiftHandler!
  var shift: Shift!
  var event: Event!

  func setup(handler: ShiftHandler, event: Event, shift: Shift) {
    self.handler = handler
    self.shift = shift
    self.event = event
    loadShift()
  }

  func toggleOptIn() {
    if let user = UserManager.currentUser {
      if shift.currentUserAssigned.boolValue {
        APIClient.optOut(user, shift: self.shift, success: { (json) in
          self.shift.currentUserAssigned = false
          self.loadShift()
        }) { (message) in
          print("No good")
        }
      }
      else {
        APIClient.optIn(user, shift: self.shift, success: { (json) in
          self.shift.currentUserAssigned = true
          self.loadShift()
        }) { (message) in
          print("No good")
        }
      }
    }
  }

  private func loadShift() {
    let ePres = EventPresenter(event: event)
    let sPres = ShiftPresenter(shift: shift)
    handler.handleNewEvent(ePres)
    handler.handleNewShift(sPres)
    let geo = EventGeo(event: event)
    handler.handleGeo(geo)
  }
}
