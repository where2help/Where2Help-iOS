//
//  ShiftMapper.swift
//  Where2Help
//
//  Created by Aaron Cruz on 3/31/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation
import JSONJoy

struct Shift: JSONJoy {
    let ID: Int!
    let eventID: Int!
    let startsAt: NSDate!
    let endsAt: NSDate!
    let volunteersNeeded: Int!
    let volunteersCount: Int!
    let createdAt: NSDate!
    let currentUserAssigned: Bool!
    
    init(_ decoder: JSONDecoder) throws {
        ID = try decoder["id"].getInt()
        eventID = try decoder["event_id"].getInt()
        startsAt = try NSDate.dateFromISOString(decoder["starts_at"].getString())
        endsAt = try NSDate.dateFromISOString(decoder["ends_at"].getString())
        volunteersNeeded = try decoder["volunteers_needed"].getInt()
        volunteersCount = try decoder["volunteers_count"].getInt()
        createdAt = try NSDate.dateFromISOString(decoder["created_at"].getString())
        currentUserAssigned = decoder["current_user_assigned"].bool
    }
}

struct Event: JSONJoy {
    let ID: Int!
    let title: String!
    let description: String?
    let shiftLength: Int!
    let address: String?
    let lat: Double?
    let lng: Double?
    let state: String!
    let createdAt: NSDate!
    let organizationName: String!
    let url: String!
    let shifts: [Shift]! = [Shift]()
    
    init(_ decoder: JSONDecoder) throws {
        ID = try decoder["id"].getInt()
        title = try decoder["title"].getString()
        description = try decoder["description"].getString()
        shiftLength = try decoder["shift_length"].getInt()
        address = try decoder["address"].getString()
        lat = decoder["lat"].double
        lng = decoder["lng"].double
        state = try decoder["state"].getString()
        createdAt = try NSDate.dateFromISOString(decoder["created_at"].getString())
        organizationName = try decoder["organization_name"].getString()
        url = try decoder["url"].getString()
        for sDecoder in decoder["shifts"].array! {
            try shifts.append(Shift(sDecoder))
        }
    }
}

class EventMapper {
    class func map(data: NSArray) -> [Event]? {
        let decoder = JSONDecoder(data)
        var events = [Event]()
        for eDecoder in decoder.array! {
            do {
                try events.append(Event(eDecoder))
            } catch {
                print("unable to parse the JSON")
                return nil
            }
        }
        return events
    }
}
