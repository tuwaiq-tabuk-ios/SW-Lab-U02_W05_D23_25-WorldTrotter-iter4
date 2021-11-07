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
    
    
    
    let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
    
    let replacementTextHasDecimalSeparator = string.range(of: ".")
    
    if existingTextHasDecimalSeparator != nil,
       replacementTextHasDecimalSeparator != nil {
      return false
    } else {
      return true
    }
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
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionViewController loaded its view.")
    updateCelsiusLabel()
    
  }
}




