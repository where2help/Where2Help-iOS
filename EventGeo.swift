//
//  EventGeo.swift
//  Where2Help
//
//  Created by Aaron Cruz on 4/9/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation

class EventGeo: Locatable {
    let event: Event!
    
    private(set) var _hasMarker: Bool
    
    // Vienna center
    let defaultCoords: Coords = (48.2082, 16.3738)
    
    private(set) var coords: Coords!
    
    init(event: Event) {
        self.event = event
        _hasMarker = false
        setCoords()
    }
    
    func hasMarker() -> Bool {
        return _hasMarker
    }
    
    func toCoords() -> Coords! {
        return coords
    }
    
    private func setCoords() {
        if let lat = event.lat, lng = event.lng {
            coords = (lat, lng)
            _hasMarker = true
            return
        }
        coords = defaultCoords
    }
}