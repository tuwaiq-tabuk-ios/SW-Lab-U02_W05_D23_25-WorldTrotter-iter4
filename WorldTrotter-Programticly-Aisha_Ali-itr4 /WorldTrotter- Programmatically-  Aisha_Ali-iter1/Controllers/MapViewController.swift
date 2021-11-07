//
//  MapViewController.swift
//  WorldTrotter- Programmatically-  Aisha_Ali-iter1
//
//  Created by Aisha Ali on 10/26/21.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
  
  var mapView:MKMapView!
  
  
  override func viewDidLoad() {
    print("MaoViewController loaded its view.")
  }
  
  
  
  override func loadView() {
    
    let labelPoint = UILabel()
    let switchPoint = UISwitch()
    mapView = MKMapView()
    view = mapView
    
    labelPoint.text = "Points of Interest"

    
    
    let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satallite"])
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
      view.addSubview(labelPoint)
    view.addSubview(switchPoint)
    let margins = view.layoutMarginsGuide
    let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 8)
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
    
    //
    
    
    
    
    labelPoint.translatesAutoresizingMaskIntoConstraints = false
    switchPoint.translatesAutoresizingMaskIntoConstraints = false
    
    let switchTopConstraint = switchPoint.centerYAnchor.constraint(equalTo: labelPoint.centerYAnchor)
    let switchLeadingConstraint = switchPoint.leadingAnchor.constraint(equalTo: labelPoint.trailingAnchor, constant: 10)
    
    switchLeadingConstraint.isActive = true
    switchTopConstraint.isActive = true
    
    switchPoint.addTarget(self, action: #selector(switchChanged(_:)),for: .valueChanged)
    
    
    let labelTopConstraint = labelPoint.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 15)
    let labelLeadingConstraint = labelPoint.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor)
    
    labelLeadingConstraint.isActive = true
    labelTopConstraint.isActive = true
    mapView.pointOfInterestFilter = .excludingAll

    
  }
  
  @objc func mapTypeChanged(_ segControl: UISegmentedControl){
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
  
  @objc func switchChanged(_ toggleControl: UISwitch) {
    
    if toggleControl.isOn {
      
      mapView.pointOfInterestFilter = .includingAll
      
    } else {
      mapView.pointOfInterestFilter = .excludingAll
    }
  }
}

