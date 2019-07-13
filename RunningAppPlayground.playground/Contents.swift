import UIKit
import CoreLocation
//
//func hmsFrom(seconds: Int) -> String {
//
//    let hours = seconds / 3600
//    let mins = (seconds % 3600) / 60
//    let secs =  (seconds % 3600) % 60
//
//    return "\(getStringFrom(number: hours)):\(getStringFrom(number: mins)):\(getStringFrom(number: secs))"
//}
//
//func getStringFrom(number: Int) -> String {
//
//    return number < 10 ? "0\(number)" : "\(number)"
//}
//
//let time = hmsFrom(seconds: 3671)

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

extension CLLocationDistance {
    
    var distanceString: String {
        let metres = Int(self)
        let kms = metres / 1000
        let ms = metres % 1000
        return metres < 1000 ? "\(ms)m" : "\(kms),\(ms.metres)km"
    }
}



let a = 1000.metres

let distance: CLLocationDistance = 6530234.123123123
let distanceString = distance.distanceString
(1901.0 as! CLLocationDistance).distanceString
(1234.0 as! CLLocationDistance).distanceString

