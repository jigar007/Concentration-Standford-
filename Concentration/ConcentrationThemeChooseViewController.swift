//
//  ConcentrationThemeChooseViewController.swift
//  Concentration
//
//  Created by Jigar Thakkar on 3/3/18.
//  Copyright © 2018 Jigar Thakkar. All rights reserved.
//

import UIKit

class ConcentrationThemeChooseViewController: UIViewController, UISplitViewControllerDelegate {
    
    let theme = [
        "Sports":"🏐⚽️🎱🏏🏈🎾🏓🏑🏸🏉⚾️🏀",
        "Animals":"🐸🦁🦊🐯🐼🐻🐹🐭🐮😸",
        "Faces":"😀😁😂😃😑😋😎😖😡😨😅"
    ]
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true 
            }
        }
        return false
    }
    
    private var splitViewDetailConcentrationViewController : ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    private var lastSeguedToCOncentrationViewCOntroller: ConcentrationViewController?
    
    
    @IBAction func changeTheme(_ sender: Any) {
        
        if let cvc = splitViewDetailConcentrationViewController{
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = theme[themeName] {
                cvc.theme = theme
            }
            
        } else if let cvc = lastSeguedToCOncentrationViewCOntroller {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = theme[themeName] {
                cvc.theme = theme
            }
            navigationController?.pushViewController(cvc, animated: true)
        } else {
            performSegue(withIdentifier: "Choose Theme", sender: sender )
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = theme[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController{
                    cvc.theme = theme
                    lastSeguedToCOncentrationViewCOntroller = cvc
                }
            }
        }
    }
}
