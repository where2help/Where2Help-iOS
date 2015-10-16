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
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var volunteerCountLabel: UILabel!
    @IBOutlet weak var volunteerCategoryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeDurationLabel: UILabel!
    
    func setFields() {
        let presenter = NeedPresenter(need: need!)
        volunteerCountLabel.text = presenter.volunteerCount()
        volunteerCategoryLabel.text = presenter.needCatTitle()
        locationLabel.text = presenter.location()
        timeDurationLabel.text = presenter.timeDuration()
        iconImageView.image = presenter.icon()
    }
}
