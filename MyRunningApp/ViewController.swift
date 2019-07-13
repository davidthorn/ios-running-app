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
import MapKit

class ViewController: UIViewController {

    var stopButtonColor: UIColor!
    var startButtonColor: UIColor!
    @IBOutlet weak var stopButton: UIButton! {
        didSet {
            guard let button = self.stopButton else { return }
            self.stopButtonColor = button.backgroundColor
            button.backgroundColor = .darkGray
            button.isEnabled = false
        }
    }
    @IBOutlet weak var startButton: UIButton! {
        didSet {
            guard let button = self.startButton else { return }
            self.startButtonColor = button.backgroundColor
            button.isEnabled = false
        }
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        self.startTrackingPosition()
        sender.isEnabled = false
        sender.backgroundColor = .darkGray
        stopButton.backgroundColor = self.stopButtonColor
        stopButton.isEnabled = true
    }
    
    @IBAction func stopButtonAction(_ sender: UIButton) {
        sender.isEnabled = false
        startButton.isEnabled = true
        startButton.backgroundColor = self.startButtonColor
        sender.backgroundColor = .darkGray
        self.locationManager.stopUpdatingLocation()
    }
    
    var startLocation: CLLocation? {
        didSet {
            guard let location = self.startLocation else { return }
            self.mapController.startLocation = location
        }
    }
    
    var locationManager: CLLocationManager!
    
    lazy var mapController: MapViewController! = {
        let vc = MapViewController.init()
        return vc
    }()
    
    @IBOutlet weak var mapHolder: UIView!
    
    internal func startTrackingPosition() {
        self.locationManager.startUpdatingLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let map = self.mapController!
        map.view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        map.view.frame = view.bounds
        mapHolder.addSubview(map.view)
        self.addChild(map)
        
        self.locationManager = CLLocationManager.init()
        self.locationManager.allowsBackgroundLocationUpdates = true
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            print("we have the correct permissions")
            self.startButton.isEnabled = true
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
    }


}


extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        if self.startLocation == nil {
            self.startLocation = location
        }
        
        print(location)
    }
    
}

