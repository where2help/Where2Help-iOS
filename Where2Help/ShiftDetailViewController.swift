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

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    interactor.setup(self, event: event, shift: shift)
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

  @IBAction func imInPressed(sender: UIButton) {
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
  }

  ///////////////////////////////////

  deinit {
    print("Deinit shift detail view controller")
  }
}
