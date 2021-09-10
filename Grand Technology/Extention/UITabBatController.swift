//
//  UITabBatController.swift
//  Courstna
//
//  Created by Diaa saeed on 7/24/20.
//  Copyright © 2020 Diaa saeed. All rights reserved.
//

import Foundation
import UIKit
class MainTabBarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.barStyle = .blackOpaque
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
 

    }
}
