//
//  UIColarExtension.swift
//  protoType-Delegate-TextFIld-Abdulaziz-Albalwi
//
//  Created by عبدالعزيز البلوي on 29/03/1443 AH.
//

import  UIKit
extension UIViewController {
  func configureHidekeybordWhenRootViewTapped(){
    let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    tap.cancelsTouchesInView = false
    
    view.addGestureRecognizer(tap)
  }
  

  @objc func dismissKeyboard() {
  
    view.endEditing(true)
    
  }
}
