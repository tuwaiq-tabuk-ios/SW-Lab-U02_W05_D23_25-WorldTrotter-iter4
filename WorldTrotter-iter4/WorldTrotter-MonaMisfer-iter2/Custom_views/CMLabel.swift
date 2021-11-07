

import UIKit

class CMLabel : UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemeented")
  }
  
  
  init(text: String,
       fontSize: CGFloat,
       textColor: UIColor = UIColor.black) {
    super.init(frame: .zero)
    
    self.text = text
    self.font = UIFont.systemFont(ofSize: fontSize,
                                   weight: .regular)
    self.textColor = textColor
    configure()
  }
  
  
  func configure() {
    translatesAutoresizingMaskIntoConstraints = false
}
}
