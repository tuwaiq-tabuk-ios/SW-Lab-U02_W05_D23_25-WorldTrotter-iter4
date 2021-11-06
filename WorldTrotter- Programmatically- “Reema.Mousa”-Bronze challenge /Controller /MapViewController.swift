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
  
  //variable
  var mapView: MKMapView!
  var segmentedControl: UISegmentedControl!
  var labelMap: UILabel!
  var switchMap: UISwitch!
  
  override func loadView()
  ///creat segmentation for map 
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
}
