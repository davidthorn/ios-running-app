//
//  Int+metres.swift
//  MyRunningApp
//
//  Created by David Thorn on 13.07.19.
//  Copyright © 2019 David Thorn. All rights reserved.
//

import Foundation

extension Int {
    
    var metres: String {
        
        guard self < 1000 else {
            return "000"
        }
        
        guard self > 10  else {
            return "00\(self)"
        }
        return self < 100 ? "0\(self)" : "\(self)"
    }
    
}
