//
//  NeedsListViewController.swift
//  Where2Help
//
//  Created by Aaron Cruz on 10/11/15.
//  Copyright © 2015 Aaron Cruz. All rights reserved.
//

import UIKit

class NeedsListViewController: UITableViewController, NeedHandler {
    var storeNeeds: [Need] = []
    var needInteractor: NeedInteractor!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        needInteractor = NeedInteractor(handler: self)
        needInteractor.load()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeNeeds.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let need = storeNeeds[indexPath.row]
        let cell:NeedTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("NeedCell") as! NeedTableViewCell
        cell.need = need
        cell.setFields()
        cell.backgroundColor = ColorUtils.hexToUIColor(CellBackgroundColors[indexPath.row % 2])
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140
    }
    // MARK: - Handlers
    
    func handleLoadNeeds(needs: [Need]) {
        self.storeNeeds = needs
        self.tableView.reloadData()
    }
    
    // MARK: - Navigation
    
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
    }
}
