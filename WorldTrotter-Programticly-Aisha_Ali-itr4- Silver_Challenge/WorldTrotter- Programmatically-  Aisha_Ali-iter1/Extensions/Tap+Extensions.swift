//
//  extension.swift
//  ProtoType-Delegate-TextField-Aisha_Ali
//
//  Created by Aisha Ali on 11/4/21.
//

import UIKit

extension UIViewController {
  
  func configureHideKeyboardWhenRootViewTaped() {

    let tap = UITapGestureRecognizer (target: self, action: #selector(dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  
  @objc func dismissKeyboard(){
    view.endEditing(true)
  }
}
