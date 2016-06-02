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
  func filter(filterName: ListFilter) -> Promise<[Event]> {
    switch filterName {
    case .Current:
      return current()
    case .Past:
      return past()
    case .All:
      return all()
    }
  }

  private func current() -> Promise<[Event]> {
    return Promise { resolve, reject in

      let url = NSBundle.mainBundle().URLForResource("shifts-current", withExtension: "json")
      let data = NSData(contentsOfURL: url!)
      if let events = EventMapper.map(data!) {
        resolve(events)
        return
      }
      resolve([])
    }
  }

  private func all() -> Promise<[Event]> {
    return Promise { resolve, reject in
      let url = NSBundle.mainBundle().URLForResource("shifts-all", withExtension: "json")
      let data = NSData(contentsOfURL: url!)
      if let events = EventMapper.map(data!) {
        resolve(events)
        return
      }
      resolve([])
    }
  }

  private func past() -> Promise<[Event]> {
    return Promise { resolve, reject in
      let url = NSBundle.mainBundle().URLForResource("shifts-past", withExtension: "json")
      let data = NSData(contentsOfURL: url!)
      if let events = EventMapper.map(data!) {
        resolve(events)
        return
      }
      resolve([])
    }
  }
}
