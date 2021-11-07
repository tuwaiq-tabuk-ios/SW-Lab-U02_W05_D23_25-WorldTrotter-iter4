//
//  ConversionViewController.swift
//  WorldTrotter-iter1
//
//  Created by عبدالعزيز البلوي on 25/03/1443 AH.
//

import UIKit

class ConversionViewController: UIViewController , UITextFieldDelegate {
  
  @IBOutlet var celsiusLabel: UILabel!
  @IBOutlet var textField: UITextField!
  
  var fahrenheitValue: Measurement<UnitTemperature>?
  { didSet {
    updateCelsiusLabel()
  }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    //  print("Current text: \(String(describing: textField.text))")
    // print("Replacement text: \(string)")
    //return true }
    let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
    let replacementTextHasDecimalSeparator = string.range(of: ".")
    if existingTextHasDecimalSeparator != nil,
       replacementTextHasDecimalSeparator != nil {
      return false
    } else {
      return true }
    
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionViewController loaded its view.")
    updateCelsiusLabel()
    
    // Do any additional setup after loading the view.
    
    //let gradient = CAGradientLayer()
    
    //   gradient.frame = view.bounds
    //  gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor,UIColor.yellow.cgColor,UIColor.green.cgColor, UIColor.systemPink.cgColor,UIColor.systemIndigo.cgColor,UIColor.gray.cgColor]
    
    // view.layer.insertSublayer(gradient, at: 0)
  }
  @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
    
    // celsiusLabel.text = textField.text
    // if let text = textField.text, !text.isEmpty {
    //   celsiusLabel.text = text
    // } else {
    //  celsiusLabel.text = "???"
    //  }
    if let text = textField.text, let value = Double(text) {
      fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
    } else {
      fahrenheitValue = nil
    }
    
  }
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    textField.resignFirstResponder()
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    view.backgroundColor = .white
    
  }
  func updateCelsiusLabel() {
    if let celsiusValue = celsiusValue {
      // celsiusLabel.text = "\(celsiusValue.value)"
      celsiusLabel.text =
        numberFormatter.string(from: NSNumber(value: celsiusValue.value))
    } else {
      celsiusLabel.text = "???"
    }
    
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
