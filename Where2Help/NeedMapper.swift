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
    class func mapAll(json: JSON) -> [Need] {
        var needs: [Need] = []
        for data in json.array! {
            needs.append(map(data))
        }
        return needs
    }
    
    class func map(data: JSON) -> Need {
        let attr = data["attributes"]
        let need = Need(
            category: attr["category"].string,
            city: attr["city"].string,
            endTime: attr["end-time"].string,
            startTime: attr["start-time"].string,
            location: attr["location"].string,
            userID: attr["user-id"].int,
            volunteersCount: attr["volunteers-count"].int,
            volunteersNeeded: attr["volunteers-needed"].int,
            lat: attr["lat"].double,
            lng: attr["lng"].double
        )
        return need
    }

}