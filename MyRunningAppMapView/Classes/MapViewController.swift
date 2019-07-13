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
    
    public lazy var mapView: MKMapView = {
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

