//
//  MapViewController.swift
//  WorldTrotter- Programmatically-  “Reema.Mousa”-iter1
//
//  Created by Reema Mousa on 20/03/1443 AH.
//
import UIKit
import MapKit
//import CoreLocation
class MapViewController: UIViewController , CLLocationManagerDelegate, MKMapViewDelegate
{
  var mapView: MKMapView!
  let locationManager = CLLocationManager()
  var segmentedControl: UISegmentedControl!
  var labelMap: UILabel!
  var switchMap: UISwitch!
  
  var didZoom = false
  var currentLocation : CLLocation!
  
  override func loadView()
  {
    mapView = MKMapView()
    view = mapView
    segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.addTarget(self,
                               action: #selector(mapTypeChanged(_:)),
                               for: .valueChanged)
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    let margins = view.layoutMarginsGuide
    
    //Label
    labelMap = UILabel()
    labelMap.text = "Points of Interest"
    labelMap.translatesAutoresizingMaskIntoConstraints = false
     
    //switch
    switchMap = UISwitch()
    switchMap.addTarget(self,
                        action: #selector(toggolePointsOfSwiterrest(_:)),
                        for: .valueChanged)
    
    switchMap.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(switchMap)
    view.addSubview(labelMap)
    
    // constraints X
    
    NSLayoutConstraint.activate ([
      
      segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
      segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
      
      segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
      
      switchMap.centerYAnchor.constraint(equalTo: labelMap.centerYAnchor),
      switchMap.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
      
      labelMap.centerYAnchor.constraint(equalTo: switchMap.centerYAnchor),
      labelMap.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
      
      // constraints Y
      
      labelMap.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
      switchMap.leadingAnchor.constraint(equalTo: labelMap.trailingAnchor, constant: 8)
    ])
    
    mapView.pointOfInterestFilter = .excludingAll
  }
  override func viewDidLoad()
  {
    super.viewDidLoad()
    locationManager.delegate = self
    mapView.delegate = self
        locationPermission()
  }
  @objc func mapTypeChanged(_ segControl: UISegmentedControl)
  {
    switch segControl.selectedSegmentIndex
    {
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
  @objc func toggolePointsOfSwiterrest(_ poiSwitch: UISwitch)
  {
    if poiSwitch.isOn
    {
      mapView.pointOfInterestFilter = .includingAll
    }
    else
    {
      mapView.pointOfInterestFilter = .excludingAll
    }
  }
  //تسمح للوصول لموقع اليوزر
  func locationPermission(){
    if locationManager.authorizationStatus == .notDetermined {
      locationManager.requestWhenInUseAuthorization()
    }
    else{
      determieCurrentLocation()
    }
  }
  //تحدد موقع اليوزر
  func determieCurrentLocation(){
    guard [.authorizedWhenInUse, .authorizedAlways].contains(locationManager.authorizationStatus) else{
      print("Can't access User location")
      return
    }
    mapView.showsUserLocation = true
  }
  
  func zoomToCurrentLocation() {
    // Check to make sure we successfully obtained a location. If not, we cannot proceed.
    guard let currentLocation = currentLocation else {
      print("Unable to zoom to current location because current location is unexpectedly nil")
      return
    }
    // Only zoom the first time we get a location, to allow the user to zoom and pan afterwards.
    guard !didZoom else {
      return
    }
    mapView.setRegion(MKCoordinateRegion(
      center: currentLocation.coordinate,
      latitudinalMeters: 28.3967506,
      longitudinalMeters: 36.4766106),
                      animated: true
    )
    didZoom = true
  }
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    determieCurrentLocation()
  }
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    currentLocation = userLocation.location
    zoomToCurrentLocation()
  }
  func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
    print("unable to determain the location ")
  }
  
}

