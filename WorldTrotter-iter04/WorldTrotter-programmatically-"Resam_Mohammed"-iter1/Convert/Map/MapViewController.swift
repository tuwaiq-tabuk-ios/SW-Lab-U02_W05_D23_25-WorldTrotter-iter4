//
//  MapViewController.swift
//  WorldTrotter-programmatically-"Resam_Mohammed"-iter1
//
//  Created by Ressam Al-Thebailah on 21/03/1443 AH.
//

//import Foundation
import UIKit
import MapKit
class MapViewController: UIViewController {
  var mapView: MKMapView!
  var segmentedControl: UISegmentedControl!
 
  
  override func loadView()
  {
    mapView = MKMapView()
    view = mapView
    
    segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.addTarget(self,
                               action: #selector(mapTypeChanged(_:)),
                               for: .valueChanged)
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    let margins = view.layoutMarginsGuide
    let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    
    
  
  
  }
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    print("MapViewController loaded its view.")
  }
  
  @objc func mapTypeChanged(_ segControl: UISegmentedControl)
  {
    switch segControl.selectedSegmentIndex
    {
    case 0: mapView.mapType = .standard
    case 1: mapView.mapType = .hybrid
    case 2: mapView.mapType = .satellite
    default: break
    }
  }
}

