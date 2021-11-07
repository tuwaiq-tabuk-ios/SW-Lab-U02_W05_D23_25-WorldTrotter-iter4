//
//  ViewController.swift
//  WorldTrotter- Programmatically-  Aisha_Ali-iter1
//
//  Created by Aisha Ali on 10/24/21.
//

import UIKit


class ConversionViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var fahrenheitTextValue: UITextField!
  @IBOutlet weak var celsiusLabel: UILabel!
  
  var fahrenheitValue: Measurement<UnitTemperature>? {
    didSet{
      updateCelsiusLabel()
    }
  }
  
  
  var celsiusValue: Measurement<UnitTemperature>?{
    if let fahrenheitValue = fahrenheitValue{
      return fahrenheitValue.converted(to: .celsius)
    }else{
      return nil
    }
  }
  
  let numberFormat: NumberFormatter = {
    let number = NumberFormatter()
    number.numberStyle = .decimal
    number.minimumFractionDigits = 0
    number.maximumFractionDigits = 1
    return number
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionViewController loaded its View.")
    updateCelsiusLabel()
  }
  
  
  @IBAction func fahrenheitValueChanged(_ sender: UITextField) {
    
    if let text = sender.text , let value = Double(text) {
      fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
      
    }else{
      fahrenheitValue = nil
    }
    
  }
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
    fahrenheitTextValue.resignFirstResponder()
  }
  
  
    func updateCelsiusLabel (){
    
    if let celsiusValue = celsiusValue {
      celsiusLabel.text = numberFormat.string(from: NSNumber(value: celsiusValue.value))
    } else{
      celsiusLabel.text="???"
    }
  }
  
  
  func fahrenheitTextValue(_ textField: UITextField,
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




