//
//  ConversionViewController.swift
//  WorldTrotter- "Hajer mohamed" -iter1
//
//  Created by hajer . on 24/03/1443 AH.
//
import Foundation
import UIKit


class ConversionViewController : ViewController {
    
    @IBOutlet var celsiusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view.")
    }
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        celsiusLabel.text = textField.text
    }
    
    
    override func loadView() {
        
        // Create an empty view
        view = UIView()
        view.backgroundColor = UIColor.cmWhiteBackground
        
        
        // Creat and add subviews
        //        let valueFarenheitLabel = CMLabel(text: "212", textSize: 70, textColor:UIColor.cmOrange)
        
        let titleFarenheitLabel = CMLabel(text: "degrees Fahrenheit", textSize: 36, textColor:UIColor.cmOrange)
        
        let isReallyLabel = CMLabel(text: "is really", textSize: 36, textColor:UIColor.black)
        
        let valueCelsiusLabel = CMLabel(text: "100", textSize: 70, textColor:UIColor.cmOrange)
        
        let titleCelsiusLabel = CMLabel(text: "degrees Celsius", textSize: 36, textColor: UIColor.cmOrange)
        
        
        //        view.addSubview(valueFarenheitLabel)
        view.addSubview(titleFarenheitLabel)
        view.addSubview(isReallyLabel)
        view.addSubview(valueCelsiusLabel)
        view.addSubview(titleCelsiusLabel)
        
        
        // Add constraints
        NSLayoutConstraint.activate([
            //            valueFarenheitLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8),
            
            //            valueFarenheitLabel.centerXAnchor
            //                .constraint(equalTo: view.centerXAnchor),
            
            //            titleFarenheitLabel.topAnchor .constraint(equalTo: valueFarenheitLabel.bottomAnchor,constant: 10),
            
            titleFarenheitLabel.centerXAnchor
                .constraint(equalTo: view.centerXAnchor),
            
            isReallyLabel.topAnchor .constraint(equalTo: titleFarenheitLabel.bottomAnchor,constant: 40),
            
            isReallyLabel
                .centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            valueCelsiusLabel.topAnchor
                .constraint(equalTo: isReallyLabel.bottomAnchor,constant: 40),
            
            valueCelsiusLabel.centerXAnchor
                .constraint(equalTo: view.centerXAnchor),
            
            titleCelsiusLabel.topAnchor.constraint(equalTo: valueCelsiusLabel.bottomAnchor,constant: 10),
            
            titleCelsiusLabel.centerXAnchor
                .constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func overrideviewDidLoad() {
        super.viewDidLoad()
        print("")
    }
    
}

