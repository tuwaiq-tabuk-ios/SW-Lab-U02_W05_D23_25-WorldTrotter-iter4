import UIKit

class CustomeButton: UIButton {
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  
  init(imageName: String,
       cornerRadius: CGFloat,
       backgroundColor: UIColor,
       tintColor : UIColor) {
    
    super.init(frame: .zero)
    
    self.backgroundColor = backgroundColor
    self.setImage(UIImage(named: imageName), for: .normal)
    self.layer.cornerRadius = cornerRadius
    self.tintColor = tintColor
    
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func configure() {
    self.contentEdgeInsets = UIEdgeInsets(top: 8,
                                          left: 8,
                                          bottom: 8,
                                          right: 8)
    
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}



