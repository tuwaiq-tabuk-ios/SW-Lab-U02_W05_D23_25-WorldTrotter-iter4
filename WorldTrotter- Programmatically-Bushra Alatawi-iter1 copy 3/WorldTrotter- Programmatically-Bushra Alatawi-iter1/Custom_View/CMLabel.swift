//
//  CMLabel.swift
//  WorldTrotter- Programmatically-Bushra Alatawi-iter1
//
//  Created by bushra nazal alatwi on 26/03/1443 AH.
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
         textSize: CGFloat,
         textColor: UIColor = UIColor.black) {
        
        super.init(frame: .zero)
        self.text = text
        self.textColor = textColor
        self.font = UIFont.systemFont(ofSize: textSize)
        customize()
    }
    
    
    private func customize(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}


