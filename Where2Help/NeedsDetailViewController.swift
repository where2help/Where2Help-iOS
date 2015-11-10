//
//  NeedsDetailViewController.swift
//  Where2Help
//
//  Created by Aaron Cruz on 10/12/15.
//  Copyright © 2015 Aaron Cruz. All rights reserved.
//

import UIKit
import MapKit

class NeedsDetailViewController: UIViewController, MKMapViewDelegate, NeedDetailHandler {
    var need: Need!
    @IBOutlet weak var categoryIconImageView: UIImageView!
    @IBOutlet weak var needCountLabel: UILabel!
    @IBOutlet weak var needCategoryLabel: UILabel!
    @IBOutlet weak var needTimeLabel: UILabel!
    @IBOutlet weak var needLocationLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var imInButton: UIButton!
    @IBOutlet weak var imInActivityView: UIActivityIndicatorView!

    @IBOutlet weak var removeFromNeedView: UIView!
    
    let kMapRadius: CLLocationDistance = 1000
    let kInitialLocation = CLLocation(latitude: 48.12331423, longitude: 16.22220001)
    
    var interactor: NeedDetailInteractor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        centerMapOnLocation(kInitialLocation)
        interactor = NeedDetailInteractor(handler: self, need: need)
        interactor.setup()
    }
    
    // MARK: - UI
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            kMapRadius * 2.0, kMapRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func bootstrapUI(need: NeedPresenter) {
        categoryIconImageView.image = need.icon()
        needCountLabel.text = need.volunteerCount()
        needCategoryLabel.text = need.needCatTitle()
        needTimeLabel.text = need.timeDuration()
        needLocationLabel.text = need.location()
    }
    
    func bootstrapMap(geo: CLLocation?) {
        if let loc = geo {
            centerMapOnLocation(loc)
        }
    }
    
    // MARK: - NeedDetailHandler Handlers
    
    func handleLoadNeed(need: NeedPresenter) {
        bootstrapUI(need)
        bootstrapMap(need.geo())
    }
    
    // MARK - Actions
    
    @IBAction func imInButtonPressed(sender: AnyObject) {
        print("Im IN!")
    }
    
    @IBAction func removeFromNeedButtonPressed(sender: AnyObject) {
        print("remove user from need")
    }

    @IBAction func shareButtonPressed(sender: AnyObject) {
        print("share button pressed")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
