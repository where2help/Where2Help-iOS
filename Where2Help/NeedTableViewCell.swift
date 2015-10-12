//
//  NeedCell.swift
//  Where2Help
//
//  Created by Aaron Cruz on 10/11/15.
//  Copyright © 2015 Aaron Cruz. All rights reserved.
//

import UIKit

class NeedTableViewCell: UITableViewCell {
    
    var need: Need?
    
    @IBOutlet weak var volunteerCountLabel: UILabel!
    @IBOutlet weak var volunteerTypeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    func setFields() {
        volunteerCountLabel.text = "\(need!.volunteersNeeded! - need!.volunteersCount!)"
        volunteerTypeLabel.text = need!.category
        cityLabel.text = need!.city
        locationLabel.text = need!.location
        startTimeLabel.text = need!.startTime
        endTimeLabel.text = need!.endTime
    }
}
