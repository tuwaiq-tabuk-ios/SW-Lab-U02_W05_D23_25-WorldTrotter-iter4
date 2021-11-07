import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
  
  var mapView: MKMapView!
  var locationManager: CLLocationManager?
  
  var segmentedControl: UISegmentedControl!
  var poiSwitch: UISwitch!
  var poiLabel: UILabel!
  var poiSwitchTopConstraint: NSLayoutConstraint!
  var poiSwitchCenterConstraint: NSLayoutConstraint!
  var poiLabelTopConstraint: NSLayoutConstraint!
  var poiLabelCenterConstraint: NSLayoutConstraint!
  
  override func loadView() {
    // Create a map view
    mapView = MKMapView()
    mapView.delegate = self
    locationManager = CLLocationManager()
    locationManager!.delegate = self
    
    // Set it as *the* view of this view controller
    view = mapView
    
    let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
    segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    segmentedControl.selectedSegmentIndex = 0
    
    segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
    
    let margins = view.layoutMarginsGuide
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    
    initLocalizationButton(segmentedControl)
    
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("MapViewController loaded its view.")
    
    //      let initialLoc = CLLocation(latitude: 28.23005 , longitude: 36.28589)
    //      setStartingLocation(location: initialLoc , distance: 1000)
    //
    //
    
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
      poiSwitchCenterConstraint.isActive = false        }
    else
    {
      poiLabelTopConstraint.isActive = true
      poiSwitchCenterConstraint.isActive = true
      poiSwitchTopConstraint.isActive = false
      poiLabelCenterConstraint.isActive = false
    }
    
  }
  
  
  func initLocalizationButton(_ anyView: UIView!){
    let localizationButton = UIButton.init(type: .system)
    localizationButton.setTitle("Localization", for: .normal)
    localizationButton.translatesAutoresizingMaskIntoConstraints = false
    localizationButton.tintColor = .orange
    localizationButton.layer.borderWidth = 1
    
    view.addSubview(localizationButton)
    
    //Constraints
    let topConstraint = localizationButton.topAnchor.constraint(equalTo:anyView
                                                                  .topAnchor, constant: 70 )
    let leadingConstraint = localizationButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
    let trailingConstraint = localizationButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor )
    
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    
    localizationButton.addTarget(self , action: #selector(MapViewController.showLocalization(sender:)), for: .touchUpInside)
    
    
  }
  
  @objc func showLocalization(sender: UIButton!){
    locationManager!.requestWhenInUseAuthorization()//se agrega permiso en info.plist
    mapView.showsUserLocation = true //fire up the method mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation)
    mapView.userTrackingMode = .follow
  }
  
  
  //   func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {       //This is a method from MKMapViewDelegate, fires up when the user`s location changes
  //     let regin23 = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 780, longitudinalMeters: 750)
  //    mapView.setRegion(regin23 , animated: true)
  //  }
}
