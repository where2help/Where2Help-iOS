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
            let needs = NeedMapper.mapAll(json["data"])
            complete(needs)
        })
    }
    
    class func find(needID: Int, complete: (Need)->()) {
        Where2HelpClient.need(needID) { (json: JSON) in
            let need = NeedMapper.map(json["data"])
            complete(need)
        }
    }
}