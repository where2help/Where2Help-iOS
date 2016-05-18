//
//  EventPresenter.swift
//  Where2Help
//
//  Created by Aaron Cruz on 4/8/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation

class EventPresenter {
    let event: Event!
    var day: Int!
    var monthNum: Int!
    var month: String!
    var year: Int!
    
    var title: String!
    var location: String?
    var geo: EventGeo!
    var description: String?
    var organization: String!
    
    init(event: Event) {
        self.event = event
        guard event.shifts.count > 0 else { return }
        setDate()
        setTitle()
        setLocation()
        setDescription()
        setOrga()
    }
    
    private func setDate() {
        let shift = event.shifts[0]
        let sPres = ShiftPresenter(shift: shift)
        day = sPres.day
        month = sPres.month
        monthNum = sPres.monthNum
        year = sPres.year
    }
    
    private func setTitle() {
        title = event.title
    }
    
    private func setLocation() {
        location = event.address
    }
    
    private func setDescription() {
        description = event.description
    }
    
    private func setOrga() {
        organization = event.organizationName
    }
}
