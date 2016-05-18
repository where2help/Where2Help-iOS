//
//  EventDay.swift
//  Where2Help
//
//  Created by Aaron Cruz on 4/7/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation

class EventDay {
    let day: Int!
    let month: String!
    var events = [Event]()
    
    init(day: Int, month: String, events: [Event]) {
        self.day = day
        self.month = month
        self.events = events
    }
}
