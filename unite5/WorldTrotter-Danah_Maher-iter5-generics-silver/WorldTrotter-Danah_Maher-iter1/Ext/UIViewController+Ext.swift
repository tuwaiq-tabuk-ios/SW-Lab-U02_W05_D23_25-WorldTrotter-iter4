//
//  UIext.swift
//  WorldTrotter-Danah_Maher-iter1
//
//  Created by macbook air on 29/03/1443 AH.
//

import UIKit

extension UIViewController {
  
  func initLocalizationButton(_ anyView: UIView!){
    let localizationButton = UIButton.init(type: .system)
    localizationButton.setTitle("Localization", for: .normal)
    localizationButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(localizationButton)
    
    //Constraints
    let topConstraint = localizationButton.topAnchor.constraint(equalTo:anyView
                                                                  .topAnchor, constant: 65 )
    let leadingConstraint = localizationButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
    let trailingConstraint = localizationButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
    
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
    
    localizationButton.addTarget(self , action: #selector(MapViewController.showLocalization(sender:)), for: .touchUpInside)
    
  
  }
  @objc override func showLocalization(sender: UIButton!){
    locationManager!.requestWhenInUseAuthorization()//se agrega permiso en info.plist
    mapView.showsUserLocation = true //fire up the method mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation)
    mapView.userTrackingMode = .follow
  }
  
  
      func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
          //This is a method from MKMapViewDelegate, fires up when the user`s location changes
        let regin23 = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 780, longitudinalMeters: 750)
          mapView.setRegion(regin23 , animated: true)
      
}
}
