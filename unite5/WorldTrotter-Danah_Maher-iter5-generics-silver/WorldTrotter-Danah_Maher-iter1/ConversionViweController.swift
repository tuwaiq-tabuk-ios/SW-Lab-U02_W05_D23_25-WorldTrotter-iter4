//
//  ConversionViweController.swift
//  WorldTrotter-Danah_Maher-iter1
//
//  Created by macbook air on 26/03/1443 AH.
//

//import UIKit
//
//class ConversionVwController: UIViewController, UITextFieldDelegate {
//  
//  
//  let numberFormatter: NumberFormatter = {
//    let nf = NumberFormatter()
//    nf.numberStyle = .decimal
//    nf.minimumFractionDigits = 0
//    nf.maximumFractionDigits = 1
//    return nf
//    
//  }()
//  
//  
//  @IBOutlet weak var celsiusLabel: UILabel!
//  @IBOutlet var textField: UITextField!
//  
//  
//  var fahrenheitValue: Measurement<UnitTemperature>?
//  func didSet() {
//    updateCelsiusLabel()
//    
//    
//    var celsiusValue: Measurement<UnitTemperature>? {
//      if let fahrenheitValue = fahrenheitValue {
//        return fahrenheitValue.converted(to: celsius)
//      } else {
//        return nil }
//    }
//    
//    
//    
//    override func viewDidLoad() {
//      super.viewDidLoad()
//      print("ConversionViewController loaded its view.")
//      
//      
//      updateCelsiusLabel()
//      
//    }
//    
//    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
//  }
//      
//      if let text = textField.text,
//         let value = Double(text) {
//        fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
//      } else {
//        fahrenheitValue = nil
//      }
//    }
//    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
//        textField.resignFirstResponder()
//    }
//    }
//    
//    
//    func updateCelsiusLabel() {
//      if let celsiusValue = celsiusValue {
//        celsiusLabel.text =
//          numberFormatter.string(from: NSNumber(value: celsiusValue.value))
//      } else {
//        celsiusLabel.text = "???"
//      }
//    }
//    func textField(_ textField: UITextField,
//                   shouldChangeCharactersIn range: NSRange,
//                   replacementString string: String) -> Bool {
//      
//      let newText: String
//      if let oldText = textField.text {
//        let startIndex = oldText.index(oldText.startIndex, offsetBy: range.location)
//        let endIndex = oldText.index(startIndex, offsetBy: range.length)
//        let replacementRange = startIndex..<endIndex
//        newText = oldText.replacingCharacters(in: replacementRange, with: string)
//      } else {
//        newText = string
//        
//        print("New text: \(newText)", terminator: "")
//        if Double(newText) != nil || newText.isEmpty || newText == "-" || newText == "." {
//          print("Accepted")
//          return true
//        } else {
//          print("Rejected")
//          return false
//        }
//      }
//    }
//    
//    
//    
//    //
//    //  @IBOutlet var celsiusLabel: UILabel!
//    //  override func viewDidLoad() {
//    //    super.viewDidLoad()
//    //    print("ConversionViewController loaded its view.")
//    //    updateCelsiusLabel()
//    //  }
//    
//    
//    
//    
//    let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
//    let replacementTextHasDecimalSeparator = string.range(of: ".")
//    if existingTextHasDecimalSeparator != nil,
//       replacementTextHasDecimalSeparator != nil {
//      return false
//    } else {
//      return true }
//  }
//}
