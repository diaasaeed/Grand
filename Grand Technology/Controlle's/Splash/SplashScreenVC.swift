//
//  SplashScreenVC.swift
//  Grand Technology
//
//  Created by almotaz on 9/10/21.
//

import UIKit
import Lottie

class SplashScreenVC: UIViewController {

    @IBOutlet weak var Conview: AnimationView!
     var animationView = AnimationView()
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showIndicator()
        timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(SplashScreenVC.getCount), userInfo: nil, repeats: false)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
    }
    
    func stopTimer() {
        guard timer != nil else { return }
        timer?.invalidate()
        timer = nil
    }

    
    @objc func getCount()  {
        self.hiddenIndicator()
    }
    
    
    //MARK:- function show and hidden splash
    
    func showIndicator() {
        
        animationView.removeFromSuperview()
        Conview.isHidden = false
        animationView = AnimationView(name: "4366-game-east-west")
        animationView.frame = Conview.bounds
        animationView.contentMode = .scaleAspectFit
        Conview.layer.cornerRadius = 20
        animationView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        animationView.animationSpeed = 0.6
        animationView.loopMode = .loop
        self.Conview.addSubview(animationView)
        animationView.play()
 

     }
    
    func hiddenIndicator() {
        Conview.isHidden = true
        animationView.stop()
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "tabbar")
        self.present(vc, animated: false, completion: nil)
    }
    
    
}
