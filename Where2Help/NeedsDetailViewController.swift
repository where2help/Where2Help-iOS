//
//  NeedsDetailViewController.swift
//  Where2Help
//
//  Created by Aaron Cruz on 10/12/15.
//  Copyright © 2015 Aaron Cruz. All rights reserved.
//

import UIKit
import MapKit

class NeedsDetailViewController: UIViewController, MKMapViewDelegate {
    var need: Need!
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius = Double(1000)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
