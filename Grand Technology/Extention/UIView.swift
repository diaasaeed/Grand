//
//  UIView.swift
//  Urban Care
//
//  Created by Diaa saeed on 7/13/19.
//  Copyright © 2019 Diaa saeed. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        self.layer.add(animation, forKey: nil)
    }
    
    
    @IBInspectable
    var cornerRadiusView: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidthView: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColorView: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    
    func applyShadow() {
        self.layer.shadowOpacity = 0.5
        //        self.layer.cornerRadius = 4.0
        //        self.layer.shadowRadius = 4.0
        self.layer.shadowOffset = CGSize(width: 1, height: 3)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50).cgColor
        self.clipsToBounds = false
    }
    
    func static_shadow(){
      self.layer.shadowColor = #colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3019607843, alpha: 0.5010969606)
      self.layer.shadowOpacity = 3.5
      self.layer.shadowOffset = CGSize(width: 5, height: 5)
      self.layer.shadowRadius = 3.5
       
      self.clipsToBounds = false
      self.layer.masksToBounds = false
    }
    
    func navigation_shadow(){
       self.layer.shadowColor = #colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3019607843, alpha: 0.1033550942)
       self.layer.shadowOpacity = 2
       self.layer.shadowOffset = CGSize(width: 0, height: 5)
       self.layer.shadowRadius = 5
        self.clipsToBounds = false
       self.layer.masksToBounds = false
     }
    
    func static_shadowUp(){
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1006260701)
        self.layer.shadowOpacity = 3.5
        self.layer.shadowOffset = CGSize(width: 0, height: -5)
        self.layer.shadowRadius = 3.5
         
        self.clipsToBounds = false
        self.layer.masksToBounds = false
    }
    
    func static_shadowall(){
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1006260701)
        self.layer.shadowOpacity = 3.5
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 5
        self.clipsToBounds = false
        self.layer.masksToBounds = false
    }
    
    func shadow_Loading(){
        self.layer.shadowColor = #colorLiteral(red: 0.2838772535, green: 0.1449402273, blue: 0.7550837398, alpha: 0.3453820634)
        self.layer.shadowOpacity = 3.5
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 5
        self.clipsToBounds = false
        self.layer.masksToBounds = false
    }
    
}

extension UIViewController{
    func navigationImage(){
        let img = UIImage(named: "bg")
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
    }
    open override func awakeFromNib() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

class RoundUIView: UIView {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 20
    }
    
}

@IBDesignable extension UIView {
    @IBInspectable var shadowColor: UIColor?{
        set {
            guard let uiColor = newValue else { return }
            layer.shadowColor = uiColor.cgColor
        }
        get{
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    @IBInspectable var shadowOpacity: Float{
        set {
            layer.shadowOpacity = newValue
        }
        get{
            return layer.shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize{
        set {
            layer.shadowOffset = newValue
        }
        get{
            return layer.shadowOffset
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat{
        set {
            layer.shadowRadius = newValue
        }
        get{
            return layer.shadowRadius
        }
    }
}
@IBDesignable
class GradientView: UIView {
   
  @IBInspectable var startColor:  UIColor = .black { didSet { updateColors() }}
  @IBInspectable var endColor:   UIColor = .white { didSet { updateColors() }}
  @IBInspectable var startLocation: Double =  0.05 { didSet { updateLocations() }}
  @IBInspectable var endLocation:  Double =  0.95 { didSet { updateLocations() }}
  @IBInspectable var horizontalMode: Bool = false { didSet { updatePoints() }}
  @IBInspectable var diagonalMode:  Bool = false { didSet { updatePoints() }}
   
  override public class var layerClass: AnyClass { return CAGradientLayer.self }
   
  var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
   
  func updatePoints() {
    if horizontalMode {
      gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
      gradientLayer.endPoint  = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
    } else {
      gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
      gradientLayer.endPoint  = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
    }
  }
  func updateLocations() {
    gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
  }
  func updateColors() {
    gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
  }
  override public func layoutSubviews() {
    super.layoutSubviews()
    updatePoints()
    updateLocations()
    updateColors()
  }
}



extension UIView {

    func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0

        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }

    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }) { (completed) in
            self.isHidden = true
            completion(true)
        }
    }
    
    

    func fadeOutUp(consat:NSLayoutConstraint,view:UIView){
        consat.constant = 0
        UIView.animate(withDuration: 0.3) {
            view.layoutIfNeeded()
        }
    }
     func fadeInUP(consat:NSLayoutConstraint,height:CGFloat,view:UIView){
         consat.constant = height
         UIView.animate(withDuration: 0.3) {
             view.layoutIfNeeded()
         }
     }
}


//NSLayoutConstraint
