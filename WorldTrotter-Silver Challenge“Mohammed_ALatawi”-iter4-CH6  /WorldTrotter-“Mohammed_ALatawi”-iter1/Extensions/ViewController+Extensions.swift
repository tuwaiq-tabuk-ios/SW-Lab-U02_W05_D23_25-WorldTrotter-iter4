//
//  ViewController+Extensions.swift
//  prototype-Delegate-TextField-mohaamed_ALatawi
//
//  Created by محمد العطوي on 29/03/1443 AH.
//

import UIKit

extension UIViewController{
  
  func contlgureHideKeyboardWhenRootViewTapped(){
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
    
  }
  @objc func dismissKeyboard() {
    
    view.endEditing(true)
  }
  
}
