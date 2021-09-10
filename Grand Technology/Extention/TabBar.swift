//
//  TabBar.swift
//  Innovalz
//
//  Created by almotaz on 3/1/21.
//

import Foundation
import UIKit

class tabBar:UITabBarController{
    let bu = UIButton.init(type: .custom)
    override func viewDidLoad() {
        super.viewDidLoad()
//        bu.setTitle("tt", for: .normal)
//        bu.setTitleColor(.blue, for: .normal)
        //bu.setTitleColor(.red, for: .highlighted)
//        bu.frame = CGRect(x: 100, y: 0, width: 44, height: 44)
        bu.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.5647058824, blue: 0.9960784314, alpha: 1)
        bu.setImage(UIImage(named: "Layer 1"), for: .normal)
        self.view.insertSubview(bu, aboveSubview: self.tabBar)
        bu.addTarget(self, action: #selector(didTouchCenterButton(_:)), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bu.frame = CGRect.init(x: self.tabBar.center.x - 40 , y: self.view.bounds.height - 105, width: 80, height: 80)
        bu.cornerRadius = 40
    }
    
    @objc private func didTouchCenterButton(_ sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabbar") as! UITabBarController
        vc.selectedIndex = 2
        self.present(vc, animated: false, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

