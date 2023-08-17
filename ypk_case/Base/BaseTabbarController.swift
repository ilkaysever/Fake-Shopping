//
//  BaseTabbarController.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import UIKit

final class BaseTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        configureTabItems()
    }
    
    private func configureTabBar() {
        view.backgroundColor = AppColors.tabBarColor
        tabBar.backgroundColor = AppColors.tabBarColor
        tabBar.isTranslucent = false
        tabBar.barTintColor = AppColors.tabBarColor
        tabBar.tintColor = AppColors.white
        tabBar.unselectedItemTintColor = UIColor.lightGray
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "Ubuntu-Medium", size: 10)!], for: .normal)
    }
    
    private func configureTabItems() {
        let homeVC = HomeViewController()
        let basketVC = BasketViewController()
        
        // Set Tabbar Item Images & Titles
        homeVC.tabBarItem.image = UIImage(named: "home_fill")
        basketVC.tabBarItem.image = UIImage(named: "basket_fill")
        
        homeVC.title = "Ana Sayfa"
        basketVC.title = "Sepetim"
        
        let homeNav = BaseNavigationController(rootViewController: homeVC)
        let basketNav = BaseNavigationController(rootViewController: basketVC)
        
        setViewControllers([homeNav, basketNav], animated: true)
    }
    
}
