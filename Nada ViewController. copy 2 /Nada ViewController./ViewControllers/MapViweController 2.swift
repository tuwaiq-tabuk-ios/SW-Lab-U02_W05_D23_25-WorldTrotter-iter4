//
//  MapViweController 2.swift
//  Nada ViewController.
//
//  Created by apple on 25/03/1443 AH.
//


import UIKit
import MapKit
 
class MapViewController2: UIViewController {
  var mapView: MKMapView!
   
  override func loadView() {
    // Create a map view
    mapView = MKMapView()
     
    // Set it as *the* view of this view controller
    view = mapView
    let segmentedControl
          = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
         
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
         
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
      } 
  }
   
   
//  override func viewDidLoad() {
//      super.viewDidLoad()
//
//      print("MapViewController loaded its view.")
//  }



let margins = view.layoutMarginsGuide
     
    let leadingConstraint = segmentedControl.leadingAnchor
     .constraint(equalTo: margins.leadingAnchor)
     
    let trailingConstraint = segmentedControl.trailingAnchor
     .constraint(equalTo: margins.trailingAnchor)
  
    let pointsOfInterestLabelTopConstraint = pointsOfInterestLabel
    .constraint(greaterThanOrEqualTo: segmentedControl. .???,
                      constant: 8)
    let pointsOfInterestLabelLeadingConstraint = pointsOfInterestLabel
     .constraint(equalTo: margins. .???)
    let pointsOfInterestSwitchLeadingConstraint = pointsOfInterestSwitch
     .constraint(equalTo: pointsOfInterestLabel. .???,
                          constant: 8)
    let pointsOfinterestSwitchTopConstraint = pointsOfInterestSwitch
     .constraint(greaterThanOrEqualTo: segmentedControl. .???,
                       constant: 8)
    let pointsOfInterestVerticalAlignConstraint = pointsOfInterestLabel
     .centerYAnchor.constraint(equalTo: pointsOfInterestSwitch.centerYAnchor)
     
    // Activate constraints
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true

    pointsOfInterestLabelTopConstraint.isActive = true
    pointsOfInterestLabelLeadingConstraint.isActive = true
    pointsOfInterestSwitchLeadingConstraint.isActive = true
    pointsOfinterestSwitchTopConstraint.isActive = true
    pointsOfInterestVerticalAlignConstraint.isActive = true
viwe.addsubviwe (po)
  }
...
  @objc func togglePointsOfInterest() {
     
  }
   
