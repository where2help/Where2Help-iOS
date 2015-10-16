//
//  NeedMapper.swift
//  Where2Help
//
//  Created by Aaron Cruz on 10/11/15.
//  Copyright © 2015 Aaron Cruz. All rights reserved.
//

import UIKit
import SwiftyJSON

class NeedMapper {
    class func map(json: JSON) -> [Need] {
        var needs: [Need] = []
        for data in json.array! {
            let attr = data["attributes"]
            let need = Need(
                category: attr["category"].string,
                city: attr["city"].string,
                endTime: attr["end-time"].string,
                startTime: attr["start-time"].string,
                location: attr["location"].string,
                userID: attr["user-id"].int,

                volunteersCount: attr["volunteers-count"].int,
                volunteersNeeded: attr["volunteers-needed"].int)
            needs.append(need)
        }
        return needs
    }

}