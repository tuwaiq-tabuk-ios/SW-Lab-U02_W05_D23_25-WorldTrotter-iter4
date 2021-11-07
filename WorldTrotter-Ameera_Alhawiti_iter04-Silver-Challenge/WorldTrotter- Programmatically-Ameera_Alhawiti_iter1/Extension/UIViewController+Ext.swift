
import UIKit

extension UIViewController{
  
  func configureHideKeyboardWhenRootViewTapped(){
    let tap = UITapGestureRecognizer(target: self,
                                     action:#selector(dismissKeyboard))
    
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard(){
    view.endEditing(true)
  }
}
