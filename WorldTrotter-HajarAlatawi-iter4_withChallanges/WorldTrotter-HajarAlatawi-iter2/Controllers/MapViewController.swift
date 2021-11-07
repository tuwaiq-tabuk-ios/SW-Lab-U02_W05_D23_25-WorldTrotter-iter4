
import UIKit
import MapKit

class MapViewController: UIViewController,
                         MKMapViewDelegate,
                         CLLocationManagerDelegate {
  
  var mapView: MKMapView!
  var locationManager = CLLocationManager ()
  
  override func loadView () {
    mapView = MKMapView ()
    view = mapView
    
    mapView.delegate = self
    
    let segmentedControl
      = UISegmentedControl (items: ["Standard",
                                    "Hybrid",
                                    "Satellite"])
    
    segmentedControl.backgroundColor
      = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.addTarget (self,
                                action: #selector (mapTypeChanged (_:)),
                                for: .valueChanged)
    
    segmentedControl
      .translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview (segmentedControl)
    
    let topConstraint
      = segmentedControl.topAnchor.constraint (
        equalTo: view.safeAreaLayoutGuide.topAnchor,
        constant: 8)
    
    let margins = view.layoutMarginsGuide
    
    let leadingConstraint
      = segmentedControl.leadingAnchor.constraint (
        equalTo: margins.leadingAnchor)
    
    let trailingConstraint
      = segmentedControl.trailingAnchor.constraint (
        equalTo: margins.trailingAnchor)
    
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    
    initMyLocationButton(segmentedControl)
    
  }
  
  
  override func viewDidLoad () {
    super.viewDidLoad ()
    
    print ("MapViewController loaded its view.")
    
  }
  
  
  @objc func mapTypeChanged (_ segControl: UISegmentedControl) {
    
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
  
  
  //Silver Challenge: Displaying the User’s Region
  func initMyLocationButton (_ anyView: UIView!) {
    
    let myLocationButton = UIButton.init(type: .system)
    myLocationButton.setTitle("My Location", for: .normal)
    myLocationButton.backgroundColor = .white
    myLocationButton.tintColor = .black
    myLocationButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview (myLocationButton)
    
    //Constraints
    let topConstraint
      = myLocationButton.topAnchor.constraint(
        equalTo:anyView.topAnchor,
        constant: 700 )
    
    let leadingConstraint
      = myLocationButton.leadingAnchor.constraint(
        equalTo: view.layoutMarginsGuide.leadingAnchor)
    
    let trailingConstraint
      = myLocationButton.trailingAnchor.constraint(
        equalTo: view.layoutMarginsGuide.trailingAnchor)
    
    //Activate Constraints
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    
    
    myLocationButton.addTarget(
      self,
      action: #selector(MapViewController.showLocalization(sender:)),
      for: .touchUpInside
    )
  }
  
  
  @objc func showLocalization (sender: UIButton!){
    locationManager.requestWhenInUseAuthorization()
    mapView.showsUserLocation = true
  }
  
  
  func mapView(_ mapView: MKMapView,
               didUpdate userLocation: MKUserLocation) {
    
    let zoomedInCurrentLocation
      = MKCoordinateRegion(center: userLocation.coordinate,
                           latitudinalMeters: 500,
                           longitudinalMeters: 500)
    
    mapView.setRegion(zoomedInCurrentLocation,
                      animated: true)
  }
  
}

