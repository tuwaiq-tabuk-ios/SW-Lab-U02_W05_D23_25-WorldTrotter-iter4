//
//  ConversionViewController.swift
//  WorldTrotter-Map
//
//  Created by Mohammed on 26/03/1443 AH.
//

import UIKit

class ConversionViewController: UIViewController {

    
    
    @IBOutlet weak var celsiusLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    var fahrenheitValue: Measurement<UnitTemperature>?
    {didSet{updateCelsiusLabel()}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view.")
        // Do any additional setup after loading the view.
        
        }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField)
    {
        if let text = textField.text, let value = Double(text) {
              fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
      } else {
              fahrenheitValue = nil
          }
      }

    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
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
    
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text =
                numberFormatter.string(from: NSNumber(value: celsiusValue.value))
    } else {
            celsiusLabel.text = "???"
        }
    }
    
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
      //  print("Current text: \(String(describing: textField.text))")
     //   print("Replacement text: \(string)")
   // return true }
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
           let replacementTextHasDecimalSeparator = string.range(of: ".")
           if existingTextHasDecimalSeparator != nil,
               replacementTextHasDecimalSeparator != nil {
               return false
       } else {
       return true }
       }

}

    


