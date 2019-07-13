//
//  RunningWayPoint.swift
//  MyRunningApp
//
//  Created by David Thorn on 13.07.19.
//  Copyright © 2019 David Thorn. All rights reserved.
//

import Foundation
import CoreLocation

struct RunningWayPoint: Codable {
    let coordinates: Coordinates
    let speed: CLLocationSpeed
    let altitude: CLLocationDistance
    let timestamp: Date
}

extension CLLocation {
    var waypoint: RunningWayPoint {
        return RunningWayPoint.init(coordinates: coordinates,
                                    speed: speed,
                                    altitude: altitude,
                                    timestamp: timestamp)
    }
}
