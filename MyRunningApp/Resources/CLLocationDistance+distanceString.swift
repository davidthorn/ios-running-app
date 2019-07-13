//
//  CLLocationDistance+distanceString.swift
//  MyRunningApp
//
//  Created by David Thorn on 13.07.19.
//  Copyright © 2019 David Thorn. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocationDistance {
    
    var distanceString: String {
        let metres = Int(self)
        let kms = metres / 1000
        let ms = metres % 1000
        
        return metres < 1000 ? "\(ms)m" : "\(kms),\(ms.metres)km"
    }
}
