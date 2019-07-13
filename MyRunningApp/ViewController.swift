//
//  ViewController.swift
//  MyRunningApp
//
//  Created by David Thorn on 13.07.19.
//  Copyright © 2019 David Thorn. All rights reserved.
//

import UIKit
import CoreLocation
import MyRunningAppMapView

class ViewController: UIViewController {

    var locationManager: CLLocationManager!
    
    lazy var mapController: MapViewController! = {
        let vc = MapViewController.init()
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let map = self.mapController!
        map.view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        map.view.frame = view.bounds
        view.addSubview(map.view)
        self.addChild(map)
        
        self.locationManager = CLLocationManager.init()
        self.locationManager.allowsBackgroundLocationUpdates = true
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            print("we have the correct permissions")
        case .authorizedWhenInUse:
            print("this is a problem because it need to work when the screen is closed")
        case .denied,.restricted:
            print("send user to app settings")
        case .notDetermined:
            self.locationManager.requestAlwaysAuthorization()
        @unknown default:
            fatalError()
        }
        
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        
        
    }


}


extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        print(location)
    }
    
}

