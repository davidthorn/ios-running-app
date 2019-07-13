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

    internal var route: [CLLocation] = []
    
    public var routeLineThickness: CGFloat = 5
    public var routeColor: UIColor = UIColor.orange
    public var cameraDistance: CLLocationDistance = 2000
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
            route.append(location)
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
        map.delegate = self
        return map
    }()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        _ = self.mapView
    }
    
    public func addLocation(location: CLLocation) {
        guard self.route.count > 0 else {
            fatalError("This method must only be called once receiving a new location that is not the start location")
        }
        
        guard let last = self.route.last else {
            fatalError("There must be a last location")
        }
        
        self.route.append(location)
        
        let coordinates = [last.coordinate , location.coordinate]
        let overlay = MKPolyline.init(coordinates: coordinates, count: coordinates.count)
        self.mapView.addOverlay(overlay)
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
    public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        switch overlay {
        case is MKPolyline:
            let renderer = MKPolylineRenderer.init(overlay: overlay)
            renderer.strokeColor = self.routeColor
            renderer.lineWidth = self.routeLineThickness
            return renderer
        default: return MKOverlayRenderer.init()
        }
    }
    
}
