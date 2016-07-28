//
//  EventTableViewCell.swift
//  Where2Help
//
//  Created by Aaron Cruz on 3/31/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventTitleLabel: UILabel!
    
    weak var navigationController: UINavigationController!
    weak var detailViewController: ShiftDetailViewController!
    
    let kShiftNibName = "ShiftTableViewCell"
    let kShiftCellID = "ShiftCell"
    let kShiftCellHeight: CGFloat = 50
    let kLableViewHeight: CGFloat = 80
    
    var event: Event?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: kShiftNibName, bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: kShiftCellID)
        tableView.rowHeight = kShiftCellHeight
        tableView.scrollEnabled = false
    }
    
    func setEvent(event: Event) {
        self.event = event
        updateCellUI()
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kShiftCellID, forIndexPath: indexPath) as! ShiftTableViewCell
        cell.setShift(event!.shifts[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let evnt = event {
            let shift = evnt.shifts[indexPath.row]
            navigateToDetailView(evnt, shift: shift)
        }
    }
    
    private func navigateToDetailView(event: Event, shift: Shift) {
        detailViewController.event = event
        detailViewController.shift = shift
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    private func updateCellUI() {
        setDate()
        setLabels()
    }
    
    private func rowCount() -> Int {
        return event?.shifts.count ?? 0
    }
    
    private func setDate() {
        if let evnt = event {
            let pres = EventPresenter(event: evnt)
            dayLabel.text = "\(pres.day)"
            monthLabel.text = pres.month
        }
    }
    
    private func setLabels() {
        eventTitleLabel.text = event?.title
        eventLocationLabel.text = event?.description
    }
    
    override func layoutSubviews() {
//        let newHeight = tableView.frame.size.height + (CGFloat(rowCount()) * kShiftCellHeight)
//        tableView.frame = CGRectMake(tableView.frame.origin.x, tableView.frame.origin.y, tableView.frame.size.width, newHeight)
//        contentView.frame = CGRectMake(contentView.frame.origin.x, contentView.frame.origin.y, contentView.frame.size.width, newHeight + view.frame.height)
//        view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, kLableViewHeight)
        super.layoutSubviews()
    }
    

    deinit {
        print("De-init Event cell")
    }
    
}
