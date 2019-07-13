import UIKit

func hmsFrom(seconds: Int) -> String {
    
    let hours = seconds / 3600
    let mins = (seconds % 3600) / 60
    let secs =  (seconds % 3600) % 60
    
    return "\(getStringFrom(number: hours)):\(getStringFrom(number: mins)):\(getStringFrom(number: secs))"
}

func getStringFrom(number: Int) -> String {
    
    return number < 10 ? "0\(number)" : "\(number)"
}

let time = hmsFrom(seconds: 3671)
