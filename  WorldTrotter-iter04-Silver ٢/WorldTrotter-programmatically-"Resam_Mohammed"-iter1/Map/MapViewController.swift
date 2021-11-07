//
//  MapViewController.swift
//  WorldTrotter-programmatically-"Resam_Mohammed"-iter1
//
//  Created by Ressam Al-Thebailah on 21/03/1443 AH.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
  
  var mapView: MKMapView!
  var locationManager = CLLocationManager()
  var segmentedControl: UISegmentedControl!
  var poiSwitch: UISwitch!
  var poiLabel: UILabel!
  var poiSwitchTopConstraint: NSLayoutConstraint!
  var poiSwitchCenterConstraint: NSLayoutConstraint!
  var poiLabelTopConstraint: NSLayoutConstraint!
  var poiLabelCenterConstraint: NSLayoutConstraint!
  
  override func loadView() {
    
    mapView = MKMapView()
    
    view = mapView
    
    let standardString = NSLocalizedString("Standard", comment: "Standard map view")
       let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
       let satelliteString
               = NSLocalizedString("Satellite", comment: "Satellite map view")
       let segmentedControl
             = UISegmentedControl(items: [standardString, hybridString, satelliteString])
    
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
    
    
    poiLabel = UILabel()
    poiLabel.text = "Points of Interest"
    poiLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(poiLabel)
    
    poiSwitch = UISwitch()
    poiSwitch.addTarget(self,
                        action: #selector(poiSwitchChanged),
                        for: .valueChanged)
    poiSwitch.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(poiSwitch)
    
    poiSwitchTopConstraint = poiSwitch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
    poiLabelCenterConstraint = poiLabel.centerYAnchor.constraint(equalTo: poiSwitch.centerYAnchor)
    poiLabelTopConstraint = poiLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
    poiSwitchCenterConstraint = poiSwitch.centerYAnchor.constraint(equalTo: poiLabel.centerYAnchor)
    updateVerticalPoiConstraints()
    
    let poiLabelLeadingConstraint = poiLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let poiSwitchLeadingConstraint = poiSwitch.leadingAnchor.constraint(equalTo: poiLabel.trailingAnchor, constant: 8)
    poiLabelLeadingConstraint.isActive = true
    poiSwitchLeadingConstraint.isActive = true
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("MapViewController loaded its view.")
    locationManager.delegate = self
    mapView.delegate = self
    locationManager.requestWhenInUseAuthorization()
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
    
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
  
  
  @objc func poiSwitchChanged(_ poiSwitch: UISwitch)
  {
    if poiSwitch.isOn
    {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll
      poiLabel.font = UIFont.systemFont(ofSize: 20)
    }
    else
    {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
      poiLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    }
    updateVerticalPoiConstraints()
  }
  
  
  func updateVerticalPoiConstraints()
  {
    if poiLabel.intrinsicContentSize.height < poiSwitch.intrinsicContentSize.height
    {
      poiSwitchTopConstraint.isActive = true
      poiLabelCenterConstraint.isActive = true
      poiLabelTopConstraint.isActive = false
      poiSwitchCenterConstraint.isActive = false
    }
    else
    {
      poiLabelTopConstraint.isActive = true
      poiSwitchCenterConstraint.isActive = true
      poiSwitchTopConstraint.isActive = false
      poiLabelCenterConstraint.isActive = false
    }
  }
  
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    let span = MKCoordinateSpan(latitudeDelta:0.08, longitudeDelta: 0.08)
    let theRegion = MKCoordinateRegion(center:userLocation.coordinate, span: span)
    mapView.setRegion(theRegion, animated: true)
  }
}
