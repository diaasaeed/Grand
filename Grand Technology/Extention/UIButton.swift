//
//  UIButton.swift
//  Urban Care
//
//  Created by Diaa saeed on 6/16/19.
//  Copyright © 2019 Diaa saeed. All rights reserved.
//

import Foundation
import UIKit
//import MOLH
@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }

    
//    func changebuttonWithLanguage(){
//        if  "\(defaults.object(forKey: DefaultClass.lang) ?? "0")" == "ar" {
////            print("button image ar", defaults.object(forKey: DefaultClass.lang))
//             self.imageView?.image = UIImage(named: "arrowARsetting")
//        }
//    }
}


// to pager
class ImageButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let spacing: CGFloat = 6.0
        guard let imageSize = self.imageView?.image?.size,
            let text = self.titleLabel?.text,
            let font = self.titleLabel?.font
            else { return }
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0.0)
        let labelString = NSString(string: text)
        let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: font])
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0;
        self.contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0.0, bottom: edgeOffset, right: 0.0)
    }
}



extension UIButton {
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        //NSAttributedStringKey.foregroundColor : UIColor.blue
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}



@IBDesignable
class GradientButton: UIButton {
   
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
