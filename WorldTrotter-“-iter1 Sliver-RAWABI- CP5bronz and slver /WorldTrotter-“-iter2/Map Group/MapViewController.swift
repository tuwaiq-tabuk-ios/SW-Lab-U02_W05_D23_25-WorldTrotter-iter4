import UIKit
import MapKit

class MapViewController: UIViewController,
                         MKMapViewDelegate,
                         CLLocationManagerDelegate  {
  
  var mapView: MKMapView!
  var locationManager: CLLocationManager?
  
  var segmentedControl: UISegmentedControl!
  var pointsOfInterestLabel: UILabel!
  var pointsOfInterestSwitch: UISwitch!
  var localizationButton: UIButton!
  
  var userLocation: CLLocationManager!
  
  
  override func loadView() {
    // Create a map view
    mapView = MKMapView()
    // Set it as *the* view of this view controller
    view = mapView
    
    mapView.delegate = self
    locationManager = CLLocationManager()
    locationManager!.delegate = self
    
    
    // CREATE CONTROLS
    segmentedControl
      = createSegmentedControl(buttons: ["Standard", "Hybrid", "Satellite"],
                               backgroundColor: UIColor.white.withAlphaComponent(0.5),
                               selectedSegmentIndex: 0)
    
    pointsOfInterestLabel = createLabel(text: "Points of Interest")
    
    pointsOfInterestSwitch = createSwitch()
    
    
    
    view.addSubview(segmentedControl)
    view.addSubview(pointsOfInterestLabel)
    view.addSubview(pointsOfInterestSwitch)
   
    
    // CREATE CONSTRAINTS
    let margins = view.layoutMarginsGuide
    
    NSLayoutConstraint.activate([
      segmentedControl.topAnchor
        .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 8),
      segmentedControl.leadingAnchor
        .constraint(equalTo: margins.leadingAnchor,
                    constant: 8),
      segmentedControl.trailingAnchor
        .constraint(equalTo: margins.trailingAnchor,
                    constant: -8),
      
      pointsOfInterestLabel.topAnchor
        .constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
      pointsOfInterestSwitch.topAnchor
        .constraint(equalTo: segmentedControl.bottomAnchor,
                    constant: 20),
      pointsOfInterestLabel.centerYAnchor
        .constraint(equalTo: pointsOfInterestSwitch.centerYAnchor),
      pointsOfInterestLabel.leadingAnchor
        .constraint(equalTo: margins.leadingAnchor,
                    constant: 8),
      pointsOfInterestSwitch.leadingAnchor
        .constraint(equalTo: pointsOfInterestLabel.trailingAnchor,
                    constant: 8),
    ])
    
    
    pointsOfInterestSwitch.addTarget(
      self,
      action: #selector(pointsOfInterestSwitchChanged),
      for: .valueChanged
    )
    
    
    segmentedControl.addTarget(
      self,
      action: #selector(MapViewController.mapTypeChanged(_:)),
      for: .valueChanged
    )
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("MapViewController loaded its view.")
    
    mapView.delegate = self
    userLocation = CLLocationManager()
    userLocation.requestWhenInUseAuthorization()
    mapView.showsUserLocation = true
    print("MapViewController loaded its view.")
    
  
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
  
  
  @objc func pointsOfInterestSwitchChanged(_ poiSwitch: UISwitch) {
    if pointsOfInterestSwitch.isOn {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll
      pointsOfInterestLabel.font = UIFont.systemFont(ofSize: 20)
    }
    else {
      mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
      pointsOfInterestLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    }
  }
  
  
  @objc func showLocalization(sender: UIButton!){
    locationManager!.requestWhenInUseAuthorization()//se agrega permiso en info.plist
    mapView.showsUserLocation = true //fire up the method mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation)
    mapView.userTrackingMode = .follow
  }
  

  func createSegmentedControl(
    buttons: [String],
    backgroundColor: UIColor,
    selectedSegmentIndex: Int
  ) -> UISegmentedControl{
    
    let segmentedControl = UISegmentedControl(items: buttons)
    segmentedControl.backgroundColor = backgroundColor
    segmentedControl.selectedSegmentIndex = selectedSegmentIndex
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    
    return segmentedControl
  }
  
  
  func createLabel(text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }
  
  
  func createSwitch() -> UISwitch {
    let uiSwitch = UISwitch()
    
    uiSwitch.translatesAutoresizingMaskIntoConstraints = false
    
    return uiSwitch
  }
  
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    let span = MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
    let theRegion = MKCoordinateRegion(center: userLocation.coordinate, span: span)
    mapView.setRegion(theRegion, animated: true)
  }
  
}
