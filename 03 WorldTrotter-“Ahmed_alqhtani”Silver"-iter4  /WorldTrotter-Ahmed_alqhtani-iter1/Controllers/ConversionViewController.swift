
//  ConversionViewController.swift
//  WorldTrotter-“Ahmed_alqhtani”-iter1
//  Created by Ahmed awadh alqhtani on 27/03/1443 AH.


import UIKit

class ConversionViewController: UIViewController , UITextFieldDelegate {
  
  @IBOutlet var celsiusLabel: UILabel!
  @IBOutlet var textField: UITextField!
  var textBackup = String()
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
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf }()
  override func viewDidLoad() {
    super.viewDidLoad()
    updateCelsiusLabel()
    configureHideKeyboardWhenRootViewTapped()
  }

  
  
  func updateCelsiusLabel() {
    if let celsiusValue = celsiusValue {
      
      celsiusLabel.text =
        numberFormatter.string(from: NSNumber(value: celsiusValue.value))
      
      
    } else {
      celsiusLabel.text = "???"
    }
    
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
      
      fahrenheitValue = nil
    }
  }
  
}



