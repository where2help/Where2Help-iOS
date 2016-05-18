//
//  EventsViewController.swift
//  Where2Help
//
//  Created by Aaron Cruz on 4/7/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, EventsHandler, UICollectionViewDelegateFlowLayout {

    let kEventCellNibName = "EventCollectionViewCell"
    let kEventCellID = "EventCell"
    let kShiftDetailControllerID = "shiftDetailViewController"
    
    let interactor = EventsInteractor()
    
    var detailViewController: ShiftDetailViewController!
    
    @IBOutlet weak var filterPickerControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEventCell()
        setupDetailController()
//        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        let w = view.frame.width - 30
//        flowLayout.itemSize =
        interactor.setup(handler: self)
        
        
    }
    
    private func setupEventCell() {
        let nib = UINib(nibName: kEventCellNibName, bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: kEventCellID)
    }
    
    private func setupDetailController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        detailViewController = storyboard
            .instantiateViewControllerWithIdentifier(kShiftDetailControllerID) as! ShiftDetailViewController
    }
    
    // Mark - handlers
    
    func handleEventsUpdate() {
        print("Events updated")
        collectionView.reloadData()
    }
    
    // MARK - TableViewDelegate/DataSource
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kEventCellID, forIndexPath: indexPath) as! EventCollectionViewCell
        let event = interactor.eventFor(indexPath)
        cell.setEvent(event)
        cell.navigationController = navigationController
        cell.detailViewController = detailViewController
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interactor.eventCount()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let event = interactor.eventFor(indexPath)
        let multiplier = event.shifts.count
        let h = CGFloat(80 + (multiplier * 50))
        let w = view.frame.width - 30
        return CGSize(width: w, height: h)
    }
    
    
    @IBAction func filterPickerTapped(sender: UISegmentedControl) {
        interactor.filterList(index: sender.selectedSegmentIndex)
    }
}
