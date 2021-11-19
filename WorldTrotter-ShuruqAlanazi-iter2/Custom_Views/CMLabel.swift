//
//  CMLabel.swift
//  WorldTrotter-ShuruqAlanazi-iter2
//
//  Created by Shorouq AlAnzi on 26/03/1443 AH.
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
       textSize: CGFloat,
       textColor: UIColor = UIColor.black) {
    super.init(frame: .zero)
    
    self.text = text
    self.font = UIFont.systemFont(ofSize: textSize, weight: .regular)
    self.textColor = textColor
    
    configure()
  }
  
  func configure() {
    translatesAutoresizingMaskIntoConstraints = false
  }
}
