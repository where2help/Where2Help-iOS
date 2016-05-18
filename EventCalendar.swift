//
//  EventCalendar.swift
//  Where2Help
//
//  Created by Aaron Cruz on 4/7/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation

class EventCalendar {
    var events: [Event] = []
    
    let months = ["Jänuar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"]
    
    // TODO: currently relying on order from api
    func resetEvents(events: [Event]) {
        self.events = []
        self.events = sort(events)
    }
    
    
    private func sort(evnts: [Event]) -> [Event] {
        return evnts.sort { mine, other -> Bool in
            let minePres = EventPresenter(event: mine)
            let otherPres = EventPresenter(event: other)
            if minePres.year > otherPres.year {
                return false
            }
            if minePres.year < otherPres.year {
                return true
            }
            if minePres.year > otherPres.year {
                return false
            }
            if minePres.monthNum < otherPres.monthNum {
                return true
            }
            if minePres.monthNum > otherPres.monthNum {
                return false
            }
            if minePres.day < otherPres.day {
                return true
            }
            if minePres.day > otherPres.day {
                return false
            }
            return true
        }
    }
    
    func eventCount() -> Int {
        return events.count
    }
    
    func eventFor(row row: Int) -> Event {
        return events[row]
    }
}