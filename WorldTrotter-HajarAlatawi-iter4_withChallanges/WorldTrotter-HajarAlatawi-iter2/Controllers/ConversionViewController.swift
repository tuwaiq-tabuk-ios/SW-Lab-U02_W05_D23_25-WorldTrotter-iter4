import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate  {
  
  @IBOutlet var celsiusLabel: UILabel!
  @IBOutlet var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionViewController loaded its view.")
    
    updateCelsiusLabel()
    configureHideKeyboardWhenRootViewTapped()
  }
  
  
  @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
    
    if let text = textField.text, let value = Double(text) {
      fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
    }
    else {
      fahrenheitValue = nil
    }
  }
  
  
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter ()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
  }()
  
  
  var fahrenheitValue: Measurement <UnitTemperature>? {
    didSet {
      updateCelsiusLabel ()
    }
  }
  

  var celsiusValue: Measurement <UnitTemperature>? {
    if let fahrenheitValue = fahrenheitValue {
      return fahrenheitValue.converted(to: .celsius)
    }
    else {
      return nil
    }
  }
  
  
  func updateCelsiusLabel () {
    if let celsiusValue = celsiusValue {
      celsiusLabel.text =
        numberFormatter.string(from: NSNumber(value: celsiusValue.value))
    }
    else {
      celsiusLabel.text = "0"
    }
  }
  
  
  //Bronze Challenge: Disallow Alphabetic Characters
  func textField (_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    
    let allowedCharacterSet
      = CharacterSet(charactersIn: "0123456789.")
    
    let replacementStringCharacterSet
      = CharacterSet (charactersIn: string)
    
    if !replacementStringCharacterSet.isSubset (
        of: allowedCharacterSet) {
      return false
    }
    
    
    let existingTextHasDecimalSeparator
      = textField.text?.range (of: ".")
    
    let replacementTextHasDecimalSeparator
      = string.range (of: ".")
    
    if existingTextHasDecimalSeparator != nil,
       replacementTextHasDecimalSeparator != nil {
      return false
      
    }
    else {
      print ("Accepted")
      return true
      
    }
  }
}
