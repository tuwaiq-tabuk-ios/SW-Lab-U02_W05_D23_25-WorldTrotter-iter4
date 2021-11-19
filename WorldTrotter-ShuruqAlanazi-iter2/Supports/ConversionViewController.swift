//
//  ConversionViewController.swift
//  WorldTrotter-ShuruqAlanazi-iter2
//
//  Created by Shorouq AlAnzi on 20/03/1443 AH.
//

import UIKit

class ConversionviewController : UIViewController, UITextFieldDelegate  {
  var textBackup = String()
  
  let currentLocale = Locale.current
   

  
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf }()
  
  @IBOutlet weak var celsiusLabel: UILabel!
  @IBOutlet var textField: UITextField!
  
  
  var fahrenheitValue: Measurement<UnitTemperature>? {
    
    didSet {
      updateCelsiusLabel()
    }
  }
  
  
  var celsiusValue: Measurement<UnitTemperature>? {
    if let fahrenheitValue = fahrenheitValue {
      return fahrenheitValue.converted(to: .celsius)
    } else {
      return nil }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionViewController loaded its view.")
    
    updateCelsiusLabel()
    
    textField.delegate = true as? UITextFieldDelegate
    
  }
  
  
  
  @IBAction func fahrenheitFieldEditingChanged(_ textField : UITextField) {
    
    if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
    } else {
            fahrenheitValue = nil
        }
    }
    
//    if var text = textField.text {
//      text = text.trimmingCharacters(in: .whitespaces)
//      if let number = numberFormatter.number(from: text) {
//        fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
//      } else {
//        // Cannot convert text to valid number format
//        if text.isEmpty || text == "." || text == "-" || text == "-." {
//          // Accept text. Adding further input may make it a valid number
//          fahrenheitValue = nil
//        } else {
//          // Reject text. Restore backup
//          text = textBackup
//        }
//      }
//
//      textField.text = text
//      textBackup = text
//    } else {
//      // textField.text == nil
//      fahrenheitValue = nil
//    }
//  }
  
  
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    textField.resignFirstResponder()
  }
  
  
  func updateCelsiusLabel() {
    
    if let celsiusValue = celsiusValue {
      celsiusLabel.text =
      numberFormatter.string(from: NSNumber(value: celsiusValue.value))
    } else {
      celsiusLabel.text = "???"
    }
  }
  
  
  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String
  ) -> Bool {
    
    let currentLocale = Locale.current
      let decimalSeparator = currentLocale.decimalSeparator ?? "."
      let existingTextHasDecimalSeparator
              = textField.text?.range(of: decimalSeparator)
      let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
      if existingTextHasDecimalSeparator != nil,
          replacementTextHasDecimalSeparator != nil {
          return false
  } else {
  return true }
    
    guard let text = textField.text else {
      return false }
    return hasConcatenationOnlyDecimalNumbersAndDecimalSeparator(string1: text , string2: string)
  }
  
  
    func hasConcatenationOnlyDecimalNumbersAndDecimalSeparator(string1: String , string2: String) -> Bool {
    print("\n\n \(#function)")
    print(" - string1 :\(string1)")
    print(" - string2 : \(string2)")
    
      if hasConcatenationMoreThanOneDecimalSepartor(string1 , string2){
      return false
    }
    
    let allowedCharacters = CharacterSet.decimalDigits.union(["."])
    let forbiddenCharacters = allowedCharacters.inverted
    
    let foundForbiddenCharacters = string2.rangeOfCharacter(from: forbiddenCharacters)
    
    print("foundForbiddenCharacters : \(String(describing: foundForbiddenCharacters))")
      
      if foundForbiddenCharacters != nil {
        return false
      } else {
        return true
      }
  }

  
  func hasConcatenationMoreThanOneDecimalSepartor(_ string1 : String,
                                                  _ string2 : String) -> Bool {
    let string1HasDecimalSeparator = string1.range(of: ".")
    let string2HasDecimalSeparator = string2.range(of: ".")
    
    print("\(#function)")
    print("string1HasDecimalSeparator \(String(describing: string1HasDecimalSeparator))")
    print("string2HasDecimalSeparator \(String(describing: string2HasDecimalSeparator))")
    
    if string1HasDecimalSeparator != nil,
       string2HasDecimalSeparator != nil {
      return true
    } else {
      return false
    }
  }
  
}





