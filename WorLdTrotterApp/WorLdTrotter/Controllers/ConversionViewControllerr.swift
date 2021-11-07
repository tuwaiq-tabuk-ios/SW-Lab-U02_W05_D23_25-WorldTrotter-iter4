//
//  ConversionViewControllerr.swift
//  WorLdTrotter
//
//  Created by ahlam  on 26/03/1443 AH.
//

import Foundation


class ConversionViewControllerr: UIViewController {
    @IBOutlet var celsiusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view.")
    }
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        celsiusLabel.text = textField.text
    }
}
