


import UIKit

class ConversionViewController: UIViewController , UITextFieldDelegate {
  
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
  
  var fahrenheitValue: Measurement<UnitTemperature>?{
    didSet {
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
        print("ConversionViewController loaded its view.")
      updateCelsiusLabel()
      configureHideKeyboardWhenRootViewTapped()
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
  
  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    print("Current text: \(String(describing: textField.text))")
    print("Replacement text: <\(string)> ", terminator: "")
    
    let allowedCharacterSet = CharacterSet(charactersIn: "0123456789.")
    let replacementStringCharacterSet = CharacterSet(charactersIn: string)
    if !replacementStringCharacterSet.isSubset(of: allowedCharacterSet) {
      print("Rejected (Invalid Character)")
      return false
    }
  
  
    let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
    let replacementTextHasDecimalSeparator = string.range(of: ".")
    if existingTextHasDecimalSeparator != nil,
      replacementTextHasDecimalSeparator != nil {
      print("Rejected (Already has decimal point)")
      return false
    } else {
      print("Accepted")
      return true
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
}
