//
//  UIViewController+Extencion.swift
//  Prototype-Delegate-Textfield-RessamMohammed
//
//  Created by Ressam Al-Thebailah on 29/03/1443 AH.
//

import UIKit

extension UIViewController {
  
  func configureHideboardWhenRootViewTappe(){
    let tap = UITapGestureRecognizer(target:self, action:#selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
    @objc func dismissKeyboard(){
      view.endEditing(true)
    }
}
