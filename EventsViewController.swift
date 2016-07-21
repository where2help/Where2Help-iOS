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
  let kNoEventCellID = "NoEventCell"
  let kShiftDetailControllerID = "shiftDetailViewController"

  let interactor = EventsInteractor()

  var detailViewController: ShiftDetailViewController!

  @IBOutlet weak var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    TopNotification.showSuccess("Loading events...")
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
    collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: kNoEventCellID)
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
    if interactor.eventCount() > 0 {
      let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kEventCellID, forIndexPath: indexPath) as! EventCollectionViewCell
      let event = interactor.eventFor(indexPath)
      cell.setEvent(event)
      cell.navigationController = navigationController
      cell.detailViewController = detailViewController
      return cell
    }
    else {
      let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kNoEventCellID, forIndexPath: indexPath)
      let title = UILabel(frame: CGRectMake(0, 0, cell.bounds.size.width, 80))
      title.text = "Nothing to see here!"
      title.textColor = Theme.darkGray()
      title.font = UIFont.systemFontOfSize(24)
      title.textAlignment = NSTextAlignment.Center
      cell.contentView.addSubview(title)
      return cell
    }
  }

  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return interactor.eventCount() == 0 ? 1 : interactor.eventCount()
  }

  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    if interactor.eventCount() > 0 {
      let event = interactor.eventFor(indexPath)
      let multiplier = event.shifts.count
      let h = CGFloat(80 + (multiplier * 50))
      let w = view.frame.width - 30
      return CGSize(width: w, height: h)
    }
    else {
      return CGSize(width: view.frame.width - 30, height: view.frame.height)
    }
  }
}
