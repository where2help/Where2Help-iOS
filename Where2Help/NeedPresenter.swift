//
//  NeedPresenter.swift
//  Where2Help
//
//  Created by Aaron Cruz on 10/16/15.
//  Copyright © 2015 Aaron Cruz. All rights reserved.
//

import UIKit
import CoreLocation
class NeedPresenter {
    let need: Need!
    
    init(need: Need) {
        self.need = need
    }
    
    func icon() -> UIImage {
        if let str = need.category {
            switch str {
            case "general":
                return UIImage(named: CategoryIcon.Volunteer.rawValue)!
            case "legal":
                return UIImage(named: CategoryIcon.Legal.rawValue)!
            case "medical":
                return UIImage(named: CategoryIcon.Medical.rawValue)!
            case "translation":
                return UIImage(named: CategoryIcon.Interpreter.rawValue)!
            default:
                return UIImage(named: CategoryIcon.Other.rawValue)!
            }
        }
        return UIImage(named: CategoryIcon.Other.rawValue)!
    }
    
    func needCatTitle() -> String {
        if let str = need.category {
            return str.capitalizedString
        }
        return ""
    }
    
    func volunteerCount() -> String {
        return "\(need!.volunteersNeeded! - need!.volunteersCount!)"
    }
    
    func location() -> String {
        var loc = ""
        var city = ""
        if need.location != nil {
            loc = need.location!
        }
        if need.city != nil {
            city = need.city!
        }
        
        return "\(loc), \(city)"
    }
    
    func geo() -> CLLocation? {
        if let lat = need.lat, lng = need.lng {
            return CLLocation(latitude: lat, longitude: lng)
        }
        return nil
    }
    
    func timeDuration() -> String {
        return "\(need.startTime!) - \(need.endTime!)"
        
    }
}
