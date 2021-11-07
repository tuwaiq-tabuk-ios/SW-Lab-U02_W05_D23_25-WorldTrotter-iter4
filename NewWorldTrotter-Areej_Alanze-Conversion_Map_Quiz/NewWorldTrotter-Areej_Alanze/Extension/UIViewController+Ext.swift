//
//  VC+Ext.swift
//  NewWorldTrotter-Areej_Alanze
//
//  Created by A A on 04/11/2021.
//

import UIKit

extension UIViewController {
  
  func configureHideKeyboardWhenRootViewTapped(){
    // Looks for single or multiple taps.
    let tap = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
    
    tap.cancelsTouchesInView = false
    
    view.addGestureRecognizer(tap)
  }
  
  
  @objc func dismissKeyboard(){
    view.endEditing(true)
  }
}
