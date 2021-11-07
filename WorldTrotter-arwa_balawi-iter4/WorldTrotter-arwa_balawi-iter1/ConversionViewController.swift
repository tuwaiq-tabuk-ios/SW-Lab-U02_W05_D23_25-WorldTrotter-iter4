//
//  ViewController.swift
//  WorldTrotter-arwa_balawi-iter1
//
//  Created by arwa balawi on 18/03/1443 AH.
//

import UIKit

class ConversionViewController: UIViewController ,  UITextFieldDelegate {
  
  @IBOutlet var celsiusLabel: UILabel!
  @IBOutlet var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionViewController loaded its View.")
    updateCelsiusLabel()
  }
  override func viewWillAppear(_: Bool) {
    super.viewWillAppear(true)
    let red = CGFloat(Float(arc4random()) / (Float(UINT32_MAX)))
    let blue = CGFloat(Float(arc4random()) / (Float(UINT32_MAX)))
    let green = CGFloat(Float(arc4random()) / (Float(UINT32_MAX)))
    print(red, blue, green)
    view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
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

    
  
    /// Bronze Challenge
  
  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
      
      let letterCharacters = NSCharacterSet.letters
      let spaceCharacters = NSCharacterSet.whitespacesAndNewlines
      let punctuationAndSpecialCharacters = CharacterSet.init(charactersIn: "!#$&@~()[];,<>/?*|'\'" )
      
      let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
      let replacementTextHasDecimalSeparator = string.range(of: ".")
      let containLetterCharacter = string.rangeOfCharacter(from: letterCharacters)
      let containSpacesAndNewLineCharacters = string.rangeOfCharacter(from: spaceCharacters)
      let containPunctuationAndSpecialCharacters = string.rangeOfCharacter(from: punctuationAndSpecialCharacters)
      
      if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
          return false
      } else if containLetterCharacter != nil {
          return false
      } else if containSpacesAndNewLineCharacters != nil {
          return false
      } else if containPunctuationAndSpecialCharacters != nil {
          return false
      } else {
          return true
  }

  }
}

