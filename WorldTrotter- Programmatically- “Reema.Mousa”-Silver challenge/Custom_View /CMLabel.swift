//
//  CMLabel.swift
//  WorldTrotter- Programmatically-  “Reema.Mousa”-iter1
//
//  Created by Reema Mousa on 26/03/1443 AH.
//

import UIKit

class CMLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  init(text: String,
       fontSize: CGFloat,
       textColor: UIColor) {
    super.init(frame: .zero)
    
    self.text = text
    self.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
    self.textColor = textColor
    
    configure()
  }
  
  
  func configure() {
    translatesAutoresizingMaskIntoConstraints = false
  }
}
