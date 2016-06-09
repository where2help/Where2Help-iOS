//
//  EventsInteractor.swift
//  Where2Help
//
//  Created by Aaron Cruz on 4/7/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation

enum ListFilter: Int {
  case Current = 0
  case Past
  case All
}

class EventsInteractor {
  var handler: EventsHandler!
  let events = EventCalendar()

  func setup(handler handler: EventsHandler) {
    self.handler = handler
    loadEvents()
  }

  func eventCount() -> Int {
    return events.eventCount()
  }

  func eventFor(indexPath: NSIndexPath) -> Event {
    return events.eventFor(row: indexPath.row)
  }

  // MARK - Private Methods

  private func loadEvents() {
    let store = EventStore()
    if let user = UserManager.currentUser {
      store.filter(user).then { events -> Void in
        self.events.resetEvents(events)
        self.handler.handleEventsUpdate()
      }
    }
  }
}
