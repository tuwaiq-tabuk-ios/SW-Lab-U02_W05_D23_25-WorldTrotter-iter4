//
//  ViewController.swift
//  WorldTrotteriter1
//
//  Created by Yousef Albalawi on 19/03/1443 AH.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet var celsiusLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionViewController loaded its view.")
  }
  
  
  @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
    if let text = textField.text, let value = Double(text) {
      fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
    } else {
      fahrenheitValue = nil
    }
  }
  
  
  
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    textField.resignFirstResponder()
  }
  
  
  var fahrenheitValue: Measurement<UnitTemperature>? { didSet {
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
      celsiusLabel.text = "0"
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
    let allowedCharacters = "1234567890."
    let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
    let typedCharacterSet = CharacterSet(charactersIn: string)
    let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
    return alphabet
    
   }
  
}


