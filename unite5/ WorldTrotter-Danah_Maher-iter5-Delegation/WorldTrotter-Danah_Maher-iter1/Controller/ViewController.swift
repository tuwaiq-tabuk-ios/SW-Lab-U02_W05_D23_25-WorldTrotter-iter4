//
//  ViewController.swift
//  WorldTrotter-Danah_Maher-iter1
//
//  Created by macbook air on 19/03/1443 AH.
//

import UIKit


class ViewController: UIViewController , UITextFieldDelegate {
  var textBackup = String()
  
  
  @IBOutlet weak var celsiusLabel: UILabel!
  @IBOutlet var textField: UITextField!
  
  
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf }()
  
  var fahrenheitValue: Measurement<UnitTemperature>? { didSet {
    
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
  
  
  
  
  func updateCelsiusLabel() {
    
    if let celsiusValue = celsiusValue {
      celsiusLabel.text =
        numberFormatter.string(from: NSNumber(value: celsiusValue.value))
    } else {
      celsiusLabel.text = "???"
    }
  }
  
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    let newText: String
    if let oldText = textField.text {
      let startIndex = oldText.index(oldText.startIndex, offsetBy: range.location)
      let endIndex = oldText.index(startIndex, offsetBy: range.length)
      let replacementRange = startIndex..<endIndex
      newText = oldText.replacingCharacters(in: replacementRange, with: string)
    } else {
      newText = string
    }
    
    print("New text: \(newText) ", terminator: "")
    if Double(newText) != nil || newText.isEmpty || newText == "-" || newText == "." {
      print("Accepted")
      return true
    } else {
      print("Rejected")
      return false
    }
  }
  
  
}
