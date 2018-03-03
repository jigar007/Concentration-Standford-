//
//  ConcentrationThemeChooseViewController.swift
//  Concentration
//
//  Created by Jigar Thakkar on 3/3/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//

import UIKit

class ConcentrationThemeChooseViewController: UIViewController {
    
    let theme = [
        "Sports":"🏐⚽️🎱🏏🏈🎾🏓🏑🏸🏉⚾️🏀",
        "Animals":"🐸🦁🦊🐯🐼🐻🐹🐭🐮😸",
        "Faces":"😀😁😂😃😑😋😎😖😡😨😅"
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = theme[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController{
                    cvc.theme = theme
                }
            }
        }
    }
}
