//
//  NeedsStore.swift
//  Where2Help
//
//  Created by Aaron Cruz on 10/11/15.
//  Copyright © 2015 Aaron Cruz. All rights reserved.
//

import Foundation
import SwiftyJSON

class NeedsStore {
    class func needs(complete: ([Need]->())) {
        Where2HelpClient.needsList({ (json: JSON) in
            let needs = NeedMapper.map(json["data"])
            complete(needs)
        })
    }
}