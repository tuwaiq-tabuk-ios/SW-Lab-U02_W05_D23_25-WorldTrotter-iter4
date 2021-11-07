//
//  MapViewController.swift
//  WorldTrotter-MarzouqAlmukhlif-iter2
//
//  Created by Marzouq Almukhlif on 21/03/1443 AH.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  var mapView: MKMapView!
  var switchMap: UISwitch!
  
  override func loadView() {
    
    mapView = MKMapView()
    view = mapView
    
    let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    
    let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
    let margins = view.layoutMarginsGuide
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    
    segmentedControl.addTarget(self, action: #selector(mapTypeChanged),for: .valueChanged)
    
    
    // add label to mapview
    let label = UILabel()
    label.text = "Points of Interest"
    view.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    let topConstraintLabel = label.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
    let leadingConstraintLabel = label.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let trailingConstraintLabel = label.trailingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 150)
    
    topConstraintLabel.isActive = true
    leadingConstraintLabel.isActive = true
    trailingConstraintLabel.isActive = true
    
    // add switch to mapview
    switchMap = UISwitch()
    switchMap.isOn = true
    view.addSubview(switchMap)
    
    
    switchMap.translatesAutoresizingMaskIntoConstraints = false
    
    let topConstraintSwitch = switchMap.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
    let leadingConstraintSwitch = switchMap.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10)
    let trailingConstraintSwitch = switchMap.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 150)
    
    topConstraintSwitch.isActive = true
    leadingConstraintSwitch.isActive = true
    trailingConstraintSwitch.isActive = true
    
    switchMap.addTarget(self, action: #selector(pointFilter), for: .valueChanged)


    
    
    
    
    
  }
  
  @objc func pointFilter(){
    if switchMap.isOn {
      mapView.pointOfInterestFilter = .includingAll
    }else{
      mapView.pointOfInterestFilter = .excludingAll
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    // Do any additional setup after loading the view.
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
      break }
  }
  
}
