//
//  NeedsListViewController.swift
//  Where2Help
//
//  Created by Aaron Cruz on 10/11/15.
//  Copyright © 2015 Aaron Cruz. All rights reserved.
//

import UIKit

class NeedsListViewController: UITableViewController, NeedsHandler {
    var storeNeeds: [Need] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()
        print("start")
        NeedsStore.needs{ needs in
            self.storeNeeds = needs
            self.tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeNeeds.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let need = storeNeeds[indexPath.row]
        let cell:NeedTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("NeedCell") as! NeedTableViewCell
        cell.need = need
        cell.setFields()
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let id = segue.identifier {
            switch id {
            case "ShowNeedDetail":
                let cell = sender as! NeedTableViewCell
                let dest = segue.destinationViewController as! NeedsDetailViewController
                dest.need = cell.need
                break
            default:
                break
            }
        }
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
}
