//
//  BaseNavigationController.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import UIKit

final class BaseNavigationController: UINavigationController {
    
    static let shared = BaseNavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateNavigationBar()
        
    }
    
    func configurateNavigationBar() {
        let titleStyle: [NSAttributedString.Key: Any] = [.foregroundColor: AppColors.white, .font: AppFonts.UbuntuMedium16!]
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = titleStyle
            appearance.shadowColor = .clear
            appearance.backgroundColor = AppColors.tabBarColor
            appearance.setBackIndicatorImage(UIImage(systemName: "arrow.left"), transitionMaskImage: UIImage(systemName: "arrow.left"))
            
            UINavigationBar.appearance().isTranslucent = false
            UINavigationBar.appearance().tintColor = AppColors.white
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().backgroundColor = AppColors.white
            UINavigationBar.appearance().tintColor = AppColors.white
            UINavigationBar.appearance().isTranslucent = false
        }
    }
    
}
