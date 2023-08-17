//
//  UIWindow+Extension.swift
//  ypk_case
//
//  Created by İlkay Sever on 18.08.2023.
//

import UIKit.UIWindow

extension UIWindow {
    
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
}
