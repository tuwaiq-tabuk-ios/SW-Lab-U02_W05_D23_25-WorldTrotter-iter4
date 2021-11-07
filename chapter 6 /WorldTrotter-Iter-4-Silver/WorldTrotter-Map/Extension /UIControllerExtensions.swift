//
//  UIControllerExtensions.swift
//  prototype-Delegate-TextField-class
//
//  Created by Mohammed on 29/03/1443 AH.
//

import UIKit
extension UIViewController

{
    func configureHideKeyboardWhenRootViewTapped() {
        let tap = UITapGestureRecognizer(
            target: self, action: #selector(dissMissKeyBoard))
           
        tap.cancelsTouchesInView = false
     
        view.addGestureRecognizer(tap)
        
    }
    
    
    @IBAction func dissMissKeyBoard() {
        view.endEditing(true)
    }
    
}
