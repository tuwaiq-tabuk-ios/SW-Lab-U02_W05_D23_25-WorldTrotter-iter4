import UIKit
import MapKit

class MapViewController: UIViewController {
  
  var mapView: MKMapView!
  
  override func loadView() {
    //   creat a map view
    mapView = MKMapView()
    //  now this is a root view
    view = mapView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("MapViewController loaded its view.")
  }
}

