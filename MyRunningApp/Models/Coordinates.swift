//
//  Coordinates.swift
//  MyRunningApp
//
//  Created by David Thorn on 13.07.19.
//  Copyright © 2019 David Thorn. All rights reserved.
//

import Foundation
import CoreLocation

struct Coordinates: Codable{
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    
    var coordinate2D: CLLocationCoordinate2D {
        return CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
    }
}

extension CLLocation {
    var coordinates: Coordinates {
        return Coordinates.init(latitude: coordinate.latitude,
                                longitude: coordinate.longitude)
    }
}
