//
//  CustomTabViewController.swift
//  STTabbar_Example
//
//  Created by Shraddha Sojitra on 19/06/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import STTabbar

class CustomTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let myTabbar = tabBar as? STTabbar {
            myTabbar.centerButtonActionHandler = {
                //RequestOfferVC
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabbar") as! UITabBarController
                vc.selectedIndex = 0
                self.present(vc, animated: false, completion: nil)
            }
        }
        
        if let myTabbar2 = tabBar as? STTabbar {
            let label = UILabel(frame: CGRect(x: (70)-(70/2), y: 55, width: 75, height: 15))
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 11.0)
            label.text = "Explore"
            label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            myTabbar2.addSubview(label)
        }
        
    }
}
