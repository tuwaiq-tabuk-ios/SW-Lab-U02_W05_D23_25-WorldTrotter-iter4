//
//  ViewController.swift
//  NewWorldTrotter-Areej_Alanze
//
//  Created by A A on 20/03/1443 AH.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
  
  
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var celsiusLabel: UILabel!
  
  var fahrenheitValue: Measurement<UnitTemperature>?{
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
  
  
  func updateCelsiusLabel() {
    if let celsiusValue = celsiusValue {
      celsiusLabel.text =
        numberFormatter.string(from: NSNumber(value: celsiusValue.value))
    } else {
      celsiusLabel.text = "??"
    }
  }
  
  
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionViewController loaded its view.")
    updateCelsiusLabel()
    configureHideKeyboardWhenRootViewTapped()
  }
  
  
  @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
    if let text = textField.text, let value = Double(text) {
      fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
    } else {
      fahrenheitValue = nil
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
      if CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string)) || (string.range(of: ".") != nil) {
        // If incoming character is a decimalDigit or a period, return true
        return true
      }
      else {
        // If a letter is detected, returns false
        return false
      }
    }
  }
}
