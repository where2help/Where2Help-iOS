//
//  MapOperation.swift
//  Where2Help
//
//  Created by Aaron Cruz on 4/9/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class MapOperation {
    class func run(geo locatable: Locatable, mapView: MKMapView) {
        let op = MapOperation()
        op.process(locatable, mapView: mapView)
    }
    
    var locatable: Locatable!
    
    var zoom: Double {
        get {
            if locatable.hasMarker() {
                return 0.02
            }
            return 0.05
        }
    }
    
    func process(locatable: Locatable, mapView: MKMapView) {
        self.locatable = locatable
        let coords = locatable.toCoords()
        let loc = makeLocation(coords)
        removeAnnotations(mapView)
        setCenter(loc, mapView: mapView)
        if locatable.hasMarker() {
            let m = marker(loc)
            mapView.addAnnotation(m)
        }
    }
    
    private func removeAnnotations(mapView: MKMapView) {
        for anno in mapView.annotations {
            mapView.removeAnnotation(anno)
        }
    }
    
    private func makeLocation(coords: Coords) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(coords.lat, coords.lng)
    }
    
    private func setCenter(loc: CLLocationCoordinate2D, mapView: MKMapView) {
        let span = MKCoordinateSpanMake(zoom, zoom)
        let region = MKCoordinateRegionMake(loc, span)
        mapView.setRegion(region, animated: false)
//        mapView.setCenterCoordinate(loc, animated: true)
    }
    
    private func marker(loc: CLLocationCoordinate2D) -> MKAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = loc
//        annotation.title = "Roatan"
//        annotation.subtitle = "Honduras"
        return annotation
    }
}