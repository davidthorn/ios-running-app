//
//  RunningActivity.swift
//  MyRunningApp
//
//  Created by David Thorn on 13.07.19.
//  Copyright © 2019 David Thorn. All rights reserved.
//

import Foundation

struct RunningActivity: Codable {
    let id: String
    let startTime: Date
    let endTime: Date?
    let positions: [RunningWayPoint]?
    
    var dictionary: [AnyHashable:Any] {
        let data = try! JSONEncoder.init().encode(self)
        return (try! JSONSerialization.jsonObject(with: data, options: .allowFragments)) as! [AnyHashable:Any]
    }
}
