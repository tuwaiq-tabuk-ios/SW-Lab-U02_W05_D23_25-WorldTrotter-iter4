import UIKit

class CustomeButton:UIButton {
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  
  init(button:UIButton,name:String
       , color: UIColor, tintColor : UIColor) {
    
    super.init(frame: .zero)
    
    self.backgroundColor = UIColor.white.withAlphaComponent(0.9)
    self.setImage(UIImage(named: name), for: .normal)
    self.layer.cornerRadius = 6
    self.translatesAutoresizingMaskIntoConstraints = false
    self.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    self.tintColor = tintColor
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}



