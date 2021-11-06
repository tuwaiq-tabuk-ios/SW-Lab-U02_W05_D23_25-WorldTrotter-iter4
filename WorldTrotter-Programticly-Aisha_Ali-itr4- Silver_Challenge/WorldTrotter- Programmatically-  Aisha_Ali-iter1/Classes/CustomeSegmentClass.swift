//
//  CustomeSegmentClass.swift
//  WorldTrotter- Programmatically-  Aisha_Ali-iter4
//
//  Created by Aisha Ali on 11/3/21.
//

import Foundation
import UIKit

class CustomeSegment:UISegmentedControl {
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  
  init(segment:[String],color: UIColor , index :Int) {
    
    super.init(frame: .zero)
    self.insertSegment(withTitle: segment[0], at: 1, animated: false)
    self.insertSegment(withTitle: segment[1], at: 2, animated: false)
    self.insertSegment(withTitle: segment[2], at: 3, animated: false)
    self.backgroundColor = color
    self.selectedSegmentIndex = index
    self.translatesAutoresizingMaskIntoConstraints = false
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
//let segmentedControl =



