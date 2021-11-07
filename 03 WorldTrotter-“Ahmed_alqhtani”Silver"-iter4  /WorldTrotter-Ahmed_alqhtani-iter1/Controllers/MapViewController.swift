//
//  MapViewController.swift
//  WorldTrotter-“Ahmed_alqhtani”-iter1
//
//  Created by Ahmed awadh alqhtani on 21/03/1443 AH.
//
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate

{
 
  
  var mapView : MKMapView!
  var locationManager: CLLocationManager!
  
  override func loadView() {
    
    
    
    locationManager = CLLocationManager()
    mapView = MKMapView()
    mapView.delegate = self
    
    
    view = mapView
    
    
    
    let segmentedControl = UISegmentedControl(items:["Standard", "Hybrid", "Satellite"])
    segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    
    let topConstraint = segmentedControl.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 8)
    let margins = view.layoutMarginsGuide
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    
  }
  @objc  func mapTypeChanged(_ segControl: UISegmentedControl) {
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("MapViewController loaded its view.")
    initLocalizationButton()
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    print("viewWillApear MapViewController loaded its view.")
    
  }
  
  func initLocalizationButton(){
    let localizationButton = UIButton.init(type: .system)
    localizationButton.setTitle("FindMe", for: .normal)
    localizationButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(localizationButton)
    
    
    
    let topConstraint = localizationButton.topAnchor.constraint(equalTo:view
                                                                  .topAnchor, constant: 780
    )
    let leadingConstraint = localizationButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
    let trailingConstraint = localizationButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
    
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    localizationButton.addTarget(self, action: #selector(showLocalization(sender:)), for: .touchUpInside)
    
  }
  
  
  @objc func showLocalization(sender: UIButton!){
    locationManager.requestWhenInUseAuthorization()
    mapView.showsUserLocation = true
  }
  
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    
    let zoomedInCurrentLocation = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 120, longitudinalMeters: 120)
    mapView.setRegion(zoomedInCurrentLocation, animated: true)
   
    
  }
 
}
