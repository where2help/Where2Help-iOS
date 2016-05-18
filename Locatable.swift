//
//  Locatable.swift
//  Where2Help
//
//  Created by Aaron Cruz on 4/9/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation

protocol Locatable {
    func toCoords() -> Coords!
    func hasMarker() -> Bool
}
