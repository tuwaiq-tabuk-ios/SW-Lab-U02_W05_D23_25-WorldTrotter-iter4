//
//  ViewController.swift
//  WorldTrotter- Programmatically-  Aisha_Ali-iter1
//  Created by Aisha Ali on 10/24/21.

import UIKit

class ConversionViewController: UIViewController {
  
  @IBOutlet weak var textField: UITextField!
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
    textField?.delegate = self
    
    configureHideKeyboardWhenRootViewTaped()
    updateCelsiusLabel()
  }
  
  
  func textFieldDidChangeSelection(_ textField: UITextField) {
    if let text = textField.text, let number = numberFormat.number(from: text) {
      fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
    } else {
      fahrenheitValue = nil
    }
  }
  
  
  func updateCelsiusLabel (){
    if let celsiusValue = celsiusValue {
      celsiusLabel.text = numberFormat.string(from: NSNumber(value: celsiusValue.value))
    } else{
      celsiusLabel.text="???"
    }
  }
}




