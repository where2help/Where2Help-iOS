//
//  EventStore.swift
//  Where2Help
//
//  Created by Aaron Cruz on 3/31/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation
import PromiseKit

class EventStore {
  func filter(user: User) -> Promise<[Event]> {
    return current(user)
  }
  private func current(user: User) -> Promise<[Event]> {
    return Promise { resolve, reject in
      APIClient.getEvents(user,
        success: { (json) in
          if let events = EventMapper.map(json) {
            resolve(events)
          }
        },
        failure: { (message) in
          print(message)
          resolve([])
        }
      )
    }
  }
}
