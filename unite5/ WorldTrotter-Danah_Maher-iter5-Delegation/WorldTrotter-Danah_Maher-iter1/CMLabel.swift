//
//  CMLabel.swift
//  WorldTrotter-Danah_Maher-iter1
//
//  Created by macbook air on 26/03/1443 AH.
//

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
      color: UIColor = UIColor.black) {
    super.init(frame: .zero)
    
    self.text = text
    self.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
    self.textColor = color
    
    configure()
  }
  
  func configure() {
    translatesAutoresizingMaskIntoConstraints = false
  }
}


//typealias CustomLabel = UILabel
//
//extension CustomLabel {
//
//  convenience init(withText text: String,
//                   size font: CGFloat,
//                   color: UIColor = UIColor(red: 0.88, green: 0.35, blue: 0.16, alpha: 1.00)) {
//    self.init()
//    self.text = text
//    self.font = UIFont.systemFont(ofSize: font, weight: .regular)
//    self.textColor = color
//  }
//}
