//
//  TimeInterval+hmsFrom.swift
//  MyRunningApp
//
//  Created by David Thorn on 13.07.19.
//  Copyright © 2019 David Thorn. All rights reserved.
//

import Foundation


extension TimeInterval {
    
    var hms: String {
        let seconds = Int(self)
        guard seconds > 59 else { return "\(seconds)" }
        let hours = seconds / 3600
        let mins = (seconds % 3600) / 60
        let secs =  (seconds % 3600) % 60
        
        if hours == 0 {
            return "\(getStringFrom(number: mins)):\(getStringFrom(number: secs))"
        }
        
        return "\(getStringFrom(number: hours)):\(getStringFrom(number: mins)):\(getStringFrom(number: secs))"
    }
    
    func getStringFrom(number: Int) -> String {
        
        return number < 10 ? "0\(number)" : "\(number)"
    }
    
}
