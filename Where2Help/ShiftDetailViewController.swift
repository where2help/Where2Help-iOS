//
//  ShiftDetailViewController.swift
//  Where2Help
//
//  Created by Aaron Cruz on 4/8/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import UIKit
import MapKit

class ShiftDetailViewController: UIViewController, ShiftHandler {
  let interactor = ShiftDetailInteractor()
  var event: Event!
  var shift: Shift!

  @IBOutlet weak var volunteerCountLabel: UILabel!
  @IBOutlet weak var eventTitleLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var organizationNameLabel: UILabel!
  @IBOutlet weak var descriptionTextView: UITextView!

  @IBOutlet weak var imInButton: OptInAndOutButton!

  @IBOutlet weak var mapView: MKMapView!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    let shareButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: #selector(shareTapped))
    self.navigationItem.rightBarButtonItem = shareButton
    interactor.setup(self, event: event, shift: shift)
  }

  func shareTapped(sender: UIView) {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = .MediumStyle
    dateFormatter.timeStyle = .ShortStyle
    let textToShare = "I'm helping out at \(event.address!) on \(dateFormatter.stringFromDate(shift.startsAt))!"

    if let myWebsite = NSURL(string: event.url)  {
      let objectsToShare = [textToShare, myWebsite]
      let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

      //New Excluded Activities Code
      activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
      //

      activityVC.popoverPresentationController?.sourceView = sender
      self.presentViewController(activityVC, animated: true, completion: nil)
    }

  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }

  // MARK: - ShiftHandler

  func handleNewEvent(event: EventPresenter) {
    updateEventFields(event)
  }

  func handleNewShift(shift: ShiftPresenter) {
    updateShiftFields(shift)
  }

  func handleGeo(geo: EventGeo) {
    print("Setting up map")
    MapOperation.run(geo: geo, mapView: mapView)
  }

  // MARK: - Actions

  @IBAction func imInPressed(sender: OptInAndOutButton) {
    sender.showLoading()
    interactor.toggleOptIn()
  }

  // MARK: - UI Updates

  private func updateEventFields(event: EventPresenter) {
    print("Updating event fields")
    eventTitleLabel.text = event.title
    descriptionTextView.text = event.description
    locationLabel.text = event.location
    organizationNameLabel.text = event.organization
  }

  private func updateShiftFields(shift: ShiftPresenter) {
    print("Updating shift fields")
    timeLabel.text = shift.timespanLabelText()
    dateLabel.text = shift.dateString()
    volunteerCountLabel.text = "\(shift.volunteersOutOfLabelText()) Volunteers"
    shift.shift.currentUserAssigned.boolValue ? imInButton.optedIn() : imInButton.optedOut()
  }

  ///////////////////////////////////

  deinit {
    print("Deinit shift detail view controller")
  }
}
