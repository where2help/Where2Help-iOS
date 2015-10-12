//
//  NeedsDetailViewController.swift
//  Where2Help
//
//  Created by Aaron Cruz on 10/12/15.
//  Copyright © 2015 Aaron Cruz. All rights reserved.
//

import UIKit

class NeedsDetailViewController: UIViewController {
    var need: Need!
    
    @IBOutlet weak var volunteerTypeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        volunteerTypeLabel.text = need.category
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
