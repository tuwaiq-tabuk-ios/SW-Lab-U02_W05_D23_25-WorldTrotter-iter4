//
//  ViewController.swift
//  WorldTrotter-MahaSaab-iter4
//
//  Created by Maha S on 01/11/2021.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate  {
  
 
  @IBOutlet weak var celsiusLabel: UILabel!
  
  var fahrenheitValue: Measurement<UnitTemperature>? {
    didSet {
      updateCelsiusLabel()
    }
  }
 
  
  let numberFormatter: NumberFormatter = {
    
      let nf = NumberFormatter()
      nf.numberStyle = .decimal
      nf.minimumFractionDigits = 0
      nf.maximumFractionDigits = 1
  return nf }()

  
  var celsiusValue: Measurement<UnitTemperature>? {
      if let fahrenheitValue = fahrenheitValue {
          return fahrenheitValue.converted(to: .celsius)
      } else {
  return nil }
  }
  
  
  func updateCelsiusLabel() {
    if let celsiusValue = celsiusValue {
      celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
    } else {
      celsiusLabel.text = "???"
    }
  }
  
  
  @IBOutlet weak var textField: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    textField.delegate = self
    
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

  
//  Bronze Challenge: Disallow Alphabetic Characters:

  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {

          let charSet = CharacterSet.letters
          let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
          let replacementTextHasDecimalSeparator = string.range(of: ".")
          let existingTextHasAlphabeticCharacters = textField.text?.rangeOfCharacter(from: charSet)
          let replacementTextHasAlphabeticCharacters = string.rangeOfCharacter(from: charSet)

          if existingTextHasDecimalSeparator != nil,
              replacementTextHasDecimalSeparator != nil {
              return false
          } else if existingTextHasAlphabeticCharacters != nil ||
                      replacementTextHasAlphabeticCharacters != nil {
                  return false
          } else {
              return true
          }
      }
  
}

