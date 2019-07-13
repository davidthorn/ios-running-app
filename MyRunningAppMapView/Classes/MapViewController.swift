//
//  MapViewController.swift
//  MyRunningAppMapView
//
//  Created by David Thorn on 13.07.19.
//  Copyright © 2019 David Thorn. All rights reserved.
//

import UIKit
import MapKit

open class MapViewController: UIViewController {

    public var cameraDistance: CLLocationDistance = 12000
    public var cameraPitch: CGFloat = 0
    public var cameraHeading: CLLocationDirection = 0
    
    public var startLocation: CLLocation? {
        didSet {
            guard let location = self.startLocation else { return }
            let camera = MKMapCamera.init(lookingAtCenter: location.coordinate,
                                          fromDistance: cameraDistance,
                                          pitch: cameraPitch,
                                          heading: cameraHeading)
            mapView.setCamera(camera, animated: true)
        }
    }
    
    internal lazy var mapView: MKMapView = {
      let map = MKMapView.init(frame: .zero)
        self.view.addSubview(map)
        map.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            map.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            map.topAnchor.constraint(equalTo: self.view.topAnchor),
            map.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            map.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        return map
    }()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        _ = self.mapView
    }
    
}

