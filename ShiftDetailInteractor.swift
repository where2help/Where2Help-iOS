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
        APIClient.optIn(user, shift: self.shift, success: { (json) in
          print("worked")
          }) { (message) in
            print("bla")
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
