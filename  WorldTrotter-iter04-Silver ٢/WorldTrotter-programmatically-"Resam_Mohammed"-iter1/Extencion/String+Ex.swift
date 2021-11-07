//
//  String+Ex.swift
//  WorldTrotter-programmatically-"Resam_Mohammed"-iter1
//
//  Created by Ressam Al-Thebailah on 02/04/1443 AH.
//

import UIKit

extension UITextFieldDelegate{
  
  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    guard let text = textField.text else {return false}
    return hasConcatenationOnlyDecimalNumbersAndDecimalSeparator(string1: text, string2:string)
  }
  func hasConcatenationOnlyDecimalNumbersAndDecimalSeparator
  (string1:String,
  string2:String)
  ->Bool{
    print("\n\n \(#function)")
    print("- string1 : \(string1)")
    print("- string2 : \(string2)")
    
    if hasConcatenationMoreThanOneDecimalSeparator(string1, string2){
      return false
    }
    
    let allowedCharecters = CharacterSet.decimalDigits.union(["."])
    let forbiddenCharecters = allowedCharecters.inverted
    
    let foundForbiddenCharecters = string2.rangeOfCharacter(from:forbiddenCharecters)
    print("foundForbiddenCharecters : \(String(describing: forbiddenCharecters))")
    
    if foundForbiddenCharecters != nil {
      return false
    }
    else {
      return true
    }
  }
  func hasConcatenationMoreThanOneDecimalSeparator(_ string1: String,
                                                   _ string2: String) -> Bool{
    let string1HasDecimalSeparator = string1.range(of: ".")
    let string2HasDecimalSeparator = string2.range(of: ".")
    
    print("\n \(#function)")
    print("string1HasDecimalSeparator: \(String(describing: string1HasDecimalSeparator))")
    print("string2HasDecimalSeparator: \(String(describing: string2HasDecimalSeparator))")
    
    if string1HasDecimalSeparator != nil,
       string2HasDecimalSeparator != nil {
      return true
    }else{
      return false
    }
  }
}
