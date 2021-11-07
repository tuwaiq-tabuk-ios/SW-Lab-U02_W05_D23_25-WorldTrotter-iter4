//
//  UIViewcontroller-Ext.swift
//  WorldTrotter-MahaSaab-iter4
//
//  Created by Maha S on 04/11/2021.
//

import UIKit

extension UIViewController {
  
  func configureHideKeyboardWhenRootViewTapped() {
    
//  looks for single or multiple taps
    let tap = UITapGestureRecognizer(target: self,
                                      action: #selector(UIViewController.dismissKeyboard))
    
    tap.cancelsTouchesInView = false
    
    view.addGestureRecognizer(tap)
  }
  
//  called when the tap is recognized.
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
  
  
}
