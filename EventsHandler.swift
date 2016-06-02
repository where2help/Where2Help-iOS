//
//  EventsHandler.swift
//  Where2Help
//
//  Created by Aaron Cruz on 4/7/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation

protocol EventsHandler {
    func handleEventsUpdate()
    func currentUser() -> User?
}