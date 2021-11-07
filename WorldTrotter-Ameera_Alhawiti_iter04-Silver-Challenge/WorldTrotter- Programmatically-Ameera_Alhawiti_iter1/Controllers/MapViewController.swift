import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
  
  var mapView: MKMapView!
  var userLocation = CLLocationManager()
  override func loadView() {
    mapView = MKMapView()
    view = mapView
    
    let segmentedControl
      = UISegmentedControl(items: ["Standar", "Hybird", "Satelite"])
    segmentedControl.backgroundColor = UIColor.systemBackground
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.addTarget(self,
                               action:#selector(mapTypeChanged(_:)),
                               for:.valueChanged)
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(segmentedControl)
    
    let topConstraint
      = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
    
    let margins = view.layoutMarginsGuide
    let leadingConstraint
      = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let trailingConstraint
      = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    
  }
  
  @objc func mapTypeChanged(_ segControl: UISegmentedControl){
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
  /// YOU ARE HERE
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //    self.userLocation.requestWhenInUseAuthorization()
    //    self.userLocation.delegate = self
    //    self.userLocation.desiredAccuracy = kCLLocationAccuracyBest
    //    self.userLocation.startUpdatingLocation()
    //    self.mapView.showsUserLocation = true
    //    self.mapView.userTrackingMode = .follow
    
    
    print("MapViewController loaded its view.")
    buttonPressedToFind()
  }
  
  func buttonPressedToFind(){
    userLocation.requestWhenInUseAuthorization()
    userLocation.delegate = self
    userLocation.desiredAccuracy = kCLLocationAccuracyBest
    userLocation.startUpdatingLocation()
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
    
  }
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    let span = MKCoordinateSpan(latitudeDelta: 500, longitudeDelta: 500)
    let theRegion = MKCoordinateRegion(center: userLocation.coordinate, span: span)
    mapView.setRegion(theRegion, animated: true)
    print(#function)
  }
}
