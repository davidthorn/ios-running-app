//
//  RunningActivity.swift
//  MyRunningApp
//
//  Created by David Thorn on 13.07.19.
//  Copyright © 2019 David Thorn. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct RunningActivity: Codable {
    let id: String
    let startTime: Date
    let endTime: Date?
    let positions: [RunningWayPoint]?
    
    var dictionary: [AnyHashable:Any] {
        let data = try! JSONEncoder.init().encode(self)
        return (try! JSONSerialization.jsonObject(with: data, options: .allowFragments)) as! [AnyHashable:Any]
    }
    
    func add(wayPoint: RunningWayPoint) -> RunningActivity {
        var points = self.positions ?? []
        points.append(wayPoint)
        return RunningActivity.init(id: id, startTime: startTime, endTime: endTime, positions: points)
    }
    
    func end(date: Date) -> RunningActivity {
        return RunningActivity.init(id: id, startTime: startTime, endTime: date, positions: positions)
    }
    
    static func start(wayPoint: RunningWayPoint) -> RunningActivity {
        let ref = Database.database().reference(withPath: "activities").childByAutoId()
        return RunningActivity.init(id: ref.key!, startTime: Date.init(), endTime: nil, positions: [wayPoint] )
    }
    
}
