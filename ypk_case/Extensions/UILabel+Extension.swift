//
//  UILabel+Extension.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import UIKit

extension UILabel {
    
    func halfTextColorChange (fullText: String, changeText: String) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemPink, range: range)
        self.attributedText = attribute
    }
    
}
