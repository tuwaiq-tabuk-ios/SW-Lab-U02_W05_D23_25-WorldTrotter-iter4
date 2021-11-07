//  MapViewController.swift
//  WorldTrotter- Programmatically-  Aisha_Ali-iter1
//
//  Created by Aisha Ali on 10/26/21.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController {
  var locationManager: CLLocationManager?
  var mapView:MKMapView!
  
  override func viewDidLoad() {
    print("MapViewController loaded its view.")
    
    mapView.delegate = self
    locationManager = CLLocationManager()
  }
  
  
  override func loadView() {
    
    mapView = MKMapView()
    view = mapView
    
    let cycleButton = CustomeButton(imageName: "MyLocation",
                                    cornerRadius: 6,
                                    backgroundColor: UIColor.white.withAlphaComponent(0.9),
                                    tintColor: UIColor.cmOrange)
       
    
    let segmentedControl = CustomeSegment(segment: ["Standard",
                                                    "Hybrid",
                                                    "Satallite"],
                                          color: UIColor.systemBackground,
                                          index: 0)
    
    view.addSubview(segmentedControl)
    view.addSubview(cycleButton)
    
    let margins = view.layoutMarginsGuide // OR only Use view.layoutMarginsGuide insted set it to constant
    
    NSLayoutConstraint.activate([
      segmentedControl.topAnchor
        .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 8),
      segmentedControl.leadingAnchor
        .constraint(equalTo: margins.leadingAnchor,
                    constant: 8),
      segmentedControl.trailingAnchor
        .constraint(equalTo: margins.trailingAnchor,
                    constant: -8),
      cycleButton.trailingAnchor
        .constraint(equalTo: margins.trailingAnchor,
                    constant: -8),
      cycleButton.topAnchor
        .constraint(equalTo: segmentedControl.bottomAnchor, constant: 10)
    ])
    
    segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
    
    cycleButton.addTarget(self, action: #selector(findMeButtonPressed), for: UIControl.Event.touchUpInside)
  }
  
  
  @objc func mapTypeChanged(_ segControl: UISegmentedControl){
    print (#function)
    
    switch segControl.selectedSegmentIndex{
    case 0:
      mapView.mapType = .standard
    case 1:
      mapView.mapType = .hybrid
    case 2:
      mapView.mapType = .satellite
    default:
      break
    }
  }
}



extension MapViewController: MKMapViewDelegate {
  
  @objc func findMeButtonPressed() {
    locationManager?.delegate = self
    locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    locationManager?.requestWhenInUseAuthorization()
    locationManager?.startUpdatingLocation()
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
  }
  
}



extension MapViewController: CLLocationManagerDelegate {
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    let span = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
    mapView.setRegion(span, animated: true)
    print(#function)
  }
  
}
