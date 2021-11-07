//
//  ConversionViewController.swift
//  WorldTrotter-MarzouqAlmukhlif-iter43
//
//  Created by Marzouq Almukhlif on 22/03/1443 AH.
//

import UIKit

class ConversionViewController: UIViewController,UITextFieldDelegate {
  
  @IBOutlet var celsiusLabel: UILabel!
  @IBOutlet var textField: UITextField!
  
  
  var fahrenheitValue: Measurement<UnitTemperature>? {
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
  
  
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textField.delegate = self
    print("ConversionViewController loaded its view.")
  }
  
  
  
  override func viewWillAppear(_ animated: Bool) {
    let colorTop =  UIColor(red: 0.89, green: 0.41, blue: 0.34, alpha: 1.00).cgColor
    let colorBottom = UIColor(red: 0.98, green: 0.60, blue: 0.42, alpha: 1.00).cgColor
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorTop, colorBottom]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.frame = view.bounds
    view.layer.insertSublayer(gradientLayer, at:0)
  }
  
  
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    textField.resignFirstResponder()
  }
  
  
  @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
    //    if let text = textField.text, !text.isEmpty {
    //      celsiusLabel.text = text
    //    } else {
    //      celsiusLabel.text = "???"
    //    }
    
    if let text = textField.text, let value = Double(text) {
      fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
    } else {
      fahrenheitValue = nil
    }
    
    
  }
  
  
  
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    let set = CharacterSet(charactersIn: "1234567890.")
    let inverted = set.inverted
    let filtered = string.components(separatedBy: inverted).joined(separator: "")
    return filtered == string
    
  }
  
  
  func updateCelsiusLabel() {
    if let celsiusValue = celsiusValue {
      celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))    } else {
        celsiusLabel.text = "???"
      }
  }
  
  
  
}
