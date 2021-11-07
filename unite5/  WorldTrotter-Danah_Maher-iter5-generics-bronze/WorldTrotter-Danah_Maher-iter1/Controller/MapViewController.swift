////
//  MapViewController.swift
//  WorldTrotter-Danah_Maher-iter1
//
//  Created by macbook air on 19/03/1443 AH.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  var mapView: MKMapView!
  var segmentedControl: UISegmentedControl!
  var poiSwitch: UISwitch!
  var poiLabel: UILabel!
  
  var poiSwitchTopConstraint: NSLayoutConstraint!
  var poiSwitchCenterConstraint: NSLayoutConstraint!
  var poiLabelTopConstraint: NSLayoutConstraint!
  var poiLabelCenterConstraint: NSLayoutConstraint!
  
  
  override func
  loadView() {
    mapView = MKMapView()
    view = mapView
    
    segmentedControl = UISegmentedControl(items: ["Standard",
                                                  "Hybrid",
                                                  "Satellite"])
    
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.addTarget(self,
                               action: #selector(mapTypeChanged),
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
    
    
    // POI label & switch
    
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
    
    // vertical constraints
    poiSwitchTopConstraint = poiSwitch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
    poiLabelCenterConstraint = poiLabel.centerYAnchor.constraint(equalTo: poiSwitch.centerYAnchor)
    poiLabelTopConstraint = poiLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
    poiSwitchCenterConstraint = poiSwitch.centerYAnchor.constraint(equalTo: poiLabel.centerYAnchor)
    updateVerticalPoiConstraints()
    
    // Horizontal constraints
    // Put the label on the left side of the screen, then put the switch after the label
    let poiLabelLeadingConstraint = poiLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let poiSwitchLeadingConstraint = poiSwitch.leadingAnchor.constraint(equalTo: poiLabel.trailingAnchor, constant: 8)
    poiLabelLeadingConstraint.isActive = true
    poiSwitchLeadingConstraint.isActive = true
  }
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    
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
      poiSwitchCenterConstraint.isActive = false        }
    else
    {
      poiLabelTopConstraint.isActive = true
      poiSwitchCenterConstraint.isActive = true
      poiSwitchTopConstraint.isActive = false
      poiLabelCenterConstraint.isActive = false
    }
    
  }
  
  
}
