//
//  ViewController.swift
//  WorldTrotter-programmatically-"Resam_Mohammed"-iter1
//
//  Created by Ressam Al-Thebailah on 18/03/1443 AH.
//

import UIKit

class ConversionViewController: UIViewController,UITextFieldDelegate {
  
  @IBOutlet weak var celsiusLabel: UILabel!
  @IBOutlet weak var textField: UITextField!
  
  
  
  var fahrenheitValue: Measurement<UnitTemperature>?{
    didSet {
      updateCelsiusLabel()
    }
  }
  
  var celsiusValue: Measurement<UnitTemperature>? {
    if let fahrenheitValue = fahrenheitValue {
      return fahrenheitValue.converted(to: .celsius)
    } else {
      return nil
      
    }
  }
  
  
  func updateCelsiusLabel() {
    if let celsiusValue = celsiusValue {
      celsiusLabel.text =
        numberFormatter.string(from: NSNumber(value: celsiusValue.value))
      
    } else {
      celsiusLabel.text = "???"
    }
  }
  
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf }()
  
  
  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    guard let text = textField.text else {return false}
    return hasConcatenationOnlyDecimalNumbersAndDecimalSeparator(string1: text, string2:string)
  }
//  func hasConcatenationOnlyDecimalNumbersAndDecimalSeparator(string1:String,
//                                                             string2:String)->Bool{
//    print("\n\n \(#function)")
//    print("- string1 : \(string1)")
//    print("- string2 : \(string2)")
//    
//    if hasConcatenationMoreThanOneDecimalSeparator(string1, string2){
//      return false
//    }
//    
//    let allowedCharecters = CharacterSet.decimalDigits.union(["."])
//    let forbiddenCharecters = allowedCharecters.inverted
//    
//    let foundForbiddenCharecters = string2.rangeOfCharacter(from:forbiddenCharecters)
//    print("foundForbiddenCharecters : \(String(describing: forbiddenCharecters))")
//    
//    if foundForbiddenCharecters != nil {
//      return false
//    }
//    else {
//      return true
//    }
//  }
//  func hasConcatenationMoreThanOneDecimalSeparator(_ string1: String,
//                                                          _ string2: String) -> Bool{
//        let string1HasDecimalSeparator = string1.range(of: ".")
//        let string2HasDecimalSeparator = string2.range(of: ".")
//        
//        print("\n \(#function)")
//        print("string1HasDecimalSeparator: \(String(describing: string1HasDecimalSeparator))")
//        print("string2HasDecimalSeparator: \(String(describing: string2HasDecimalSeparator))")
//        
//        if string1HasDecimalSeparator != nil,
//           string2HasDecimalSeparator != nil {
//          return true
//        }else{
//          return false
//        }
//      }
//    let currentLocale = Locale.current
//    let decimalSeparator = currentLocale.decimalSeparator ?? ","
//    let existingTextHasDecimalSeparator
//      = textField.text?.range(of: decimalSeparator)
//    let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
//
//
//    if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
//      return false
//
//    } else {
//      return true
//    }
 
  
  @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
    if let text = textField.text, let number = numberFormatter.number(from: text) {
      fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
    
    } else {
      fahrenheitValue = nil
    }
  }

  
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {

    textField.resignFirstResponder()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionViewController loaded its view.")
    textField.delegate = self
    updateCelsiusLabel()
    configureHideboardWhenRootViewTappe()
    
  
  
    
    
  }
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    print(#function)
    return true
    //return false
  }
  
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    print(#function)
    
  }
  
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    print(#function)
    
    return true
    
  }

}




