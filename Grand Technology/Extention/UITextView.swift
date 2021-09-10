//
//  UITextView.swift
//  Zom  Store
//
//  Created by apple on 3/18/20.
//  Copyright © 2020 Atiaf. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    
    func setHTMLFromString(text: String) {
        let modifiedFont = NSString(format:"<span style=\"font-family: \(self.font!.fontName); font-size: \(14)\">%@</span>" as NSString, text)

        let attrStr = try! NSAttributedString(
            data: modifiedFont.data(using: String.Encoding.unicode.rawValue, allowLossyConversion: true)!,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType:NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue],
            documentAttributes: nil)

        self.attributedText = attrStr
    }
    
}
