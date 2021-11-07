//
//  MapViewController.swift
//  WorldTrotter-iter1
//
//  Created by عبدالعزيز البلوي on 21/03/1443 AH.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate {
  var mapView: MKMapView!
  var locationManager: CLLocationManager!
  override func viewDidAppear(_ animated: Bool) {
    locationManager = CLLocationManager()
    locationManager.requestAlwaysAuthorization()
    locationManager.startUpdatingLocation()
    
  }
  
  override func loadView() {
    // create a map view
    mapView = MKMapView()
    mapView.delegate = self
    mapView.isZoomEnabled = true
    mapView.isScrollEnabled = true
    
    // comment the line below if automatical locating is desired
    // mapView.showsUserLocation = true
    
    view = mapView
    
    segmentedControlCreation()
    
    userLocationButtonCreation()
  }
  
  func segmentedControlCreation() {
    let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
    segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
    
    let margins = view.layoutMarginsGuide
    
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
  }
  
  @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
    switch segControl.selectedSegmentIndex {
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
  
  func userLocationButtonCreation() {
    let button: UIButton = UIButton.init(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    button.setTitle("FindMe", for: .normal)
    
    button.backgroundColor = UIColor.clear
    
    button.addTarget(self, action: #selector(showUserLocation(sender:)), for: .touchUpInside)
    
    view.addSubview(button)
    
    let margins = view.layoutMarginsGuide
    
    let bottomConstraint = button.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
    
    let leadingConstraint = button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    bottomConstraint.isActive = true
    leadingConstraint.isActive = true
    
  }
  
  @objc func showUserLocation(sender: UIButton!) {
    print("Start locating the user...")
    
    // This should be set here to avoid automatically locating
    mapView.showsUserLocation = true
    
    self.mapViewe(mapView, didUpdate: locationManager.location!)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mapView.showsUserLocation = true
  }
  
  private func mapViewe(_ mapView: MKMapView, didUpdate userLocation: CLLocation) {
    let latitude = userLocation.coordinate.latitude
    let longitude = userLocation.coordinate.longitude
    let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    let region = MKCoordinateRegion(center: center, span: span)
    
    mapView.setRegion(region, animated: true)
  }
}
