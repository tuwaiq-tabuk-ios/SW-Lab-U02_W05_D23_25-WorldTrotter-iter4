//
//  UIViewViewControllerExtenshion.swift
//  Protoype-Delegate-Textfield-ahmed alqhtani
//
//  Created by Ahmed awadh alqhtani on 29/03/1443 AH.
//

import UIKit
extension UIViewController{
  
    func configureHideKeyboardWhenRootViewTapped() {
      let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
   
      tap.cancelsTouchesInView = false
      
      view.addGestureRecognizer(tap)
      
    }
    
    @objc func dismissKeyboard() {
      view.endEditing(true)
   
    }

  }

   


