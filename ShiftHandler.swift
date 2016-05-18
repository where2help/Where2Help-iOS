//
//  ShiftsHandler.swift
//  Where2Help
//
//  Created by Aaron Cruz on 4/8/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation
protocol ShiftHandler {
    func handleNewEvent(event: EventPresenter)
    func handleNewShift(shift: ShiftPresenter)
    func handleGeo(geo: EventGeo)
}
