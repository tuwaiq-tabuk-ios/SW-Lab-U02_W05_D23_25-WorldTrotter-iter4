//
//  ConversionViewController.swift
//  WorldTrotter-“Mohammed_ALatawi”-iter1
//
//  Created by محمد العطوي on 26/03/1443 AH.
//

import UIKit

var fahrenheitValue: Measurement<UnitTemperature>?

class ConversionViewController: UIViewController,UITextFieldDelegate {
  
  @IBOutlet var celsiusLabel: UILabel!
  @IBOutlet weak var textField: UITextField!
  var textBackup = String()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("ConversionViewController loaded its view.")
    updateCelsiusLabel()
    contlgureHideKeyboardWhenRootViewTapped()
  }
  @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
    
    if var text = textField.text {
      text = text.trimmingCharacters(in: .whitespaces)
      if let number = numberFormatter.number(from: text) {
        fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
      } else {
        if text.isEmpty || text == "." || text == "-" || text == "-." {
          fahrenheitValue = nil
        } else {
          text = textBackup
        }
      }
      textField.text = text
      textBackup = text
    } else {
      // textField.text == nil
      fahrenheitValue = nil
    }
    
  }
  
  var celsiusValue: Measurement<UnitTemperature>? {
    if let fahrenheitValue = fahrenheitValue {
      return fahrenheitValue.converted(to: .celsius)
    } else {
      return nil }
    
  }
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf }()
  
  func updateCelsiusLabel() {
    if let celsiusValue = celsiusValue {
      celsiusLabel.text =
        numberFormatter.string(from: NSNumber(value: celsiusValue.value))
    } else {
      celsiusLabel.text = "???"
    }
  }
  
  var fahrenheitValue: Measurement<UnitTemperature>?
  { didSet {
    
    updateCelsiusLabel()
    
  }
  }
  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
    let replacementTextHasDecimalSeparator = string.range(of: ".")
    if existingTextHasDecimalSeparator != nil,
       replacementTextHasDecimalSeparator != nil {
      
      return false
      
    } else {
      
      return true }
  }
  
}





