//
//  NeedAnnotation.swift
//
//
//  Created by Aaron Cruz on 10/19/15.
//
//

import UIKit
import MapKit

class NeedAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    let presenter: NeedAnnotationPresenter!
    
    init(need: Need, lat: Double, lng: Double) {
        self.presenter = NeedAnnotationPresenter(need: need)
        self.title = presenter.title()
        self.subtitle = presenter.subtitle()
        self.locationName = presenter.locationName()
        self.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        super.init()
    }
}
