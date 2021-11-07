//
//  ConversionViewController.swift
//  Nada ViewController.
//
//  Created by apple on 21/03/1443 AH.
//

import Foundation
import UIKit
class ConversionViewController : UIViewController, UITextFieldDelegate {
 
 @IBOutlet var rootView: UIView!
  @IBOutlet weak var celciusLabel: UILabel!
  @IBOutlet weak var valueInput: UITextField!
  
  let numberFormatter: NumberFormatter = {
      let nf = NumberFormatter()
      nf.numberStyle = .decimal
      nf.minimumFractionDigits = 0
      nf.maximumFractionDigits = 1
  return nf }()
  
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
  
//  override func viewDidAppear(_ animated: Bool) {
//    let colors:[UIColor] = [.blue,.red,.darkGray]
//    rootView.backgroundColor = colors[Int.random(in: 0...colors.count-1)]
//  }
  
  func updateCelsiusLabel() {
      if let celsiusValue = celsiusValue {
        celciusLabel.text =
                    numberFormatter.string(from: NSNumber(value: celsiusValue.value))
      } else {
        celciusLabel.text = "???"
      }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    valueInput.delegate = self
    print("ConversionViewController loaded its view.")
    updateCelsiusLabel()
  }
  
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    //valueInput.resignFirstResponder()
  }
   
  @IBAction func fahrenhientInputField(_ textField: UITextField) {
    celciusLabel.text = textField.text
  }
  @IBAction func fahrenhietEditingChanged(_ sender: Any) {
    if let text = valueInput.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
    } else {
            fahrenheitValue = nil
        }
  }
  
//  func textField(_ textField: UITextField,
//                 shouldChangeCharactersIn range: NSRange,
//                 replacementString string: String) -> Bool {
//    let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
//        let replacementTextHasDecimalSeparator = string.range(of: ".")
//       if existingTextHasDecimalSeparator != nil,
//            replacementTextHasDecimalSeparator != nil {
//            return false
//    } else {
//    return true }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let existingStringHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalOperator = string.range(of: ".")
        let validCharacters = CharacterSet(charactersIn: ".-0123456789")
        let replacementCharacter = CharacterSet(charactersIn: string)
        
        if (existingStringHasDecimalSeparator != nil && replacementTextHasDecimalOperator != nil) || !validCharacters.isSuperset(of: replacementCharacter) || (string == "-" && range.location != 0) {
            return false
        } else {
            return true
        }
    }
    
  
  
}

