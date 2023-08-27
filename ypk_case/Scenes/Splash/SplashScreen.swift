//
//  SplashScreen.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import UIKit

final class SplashScreen: BaseViewController {
    
    // MARK: - UI Components
    
    private let splashImg: UIImageView = UIImageView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    // MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Configure UI Elements
    
    private func configureUI() {
        view.addSubviews(splashImg, indicator)
        drawDesign()
    }
    
    private func openLoginVC() {
        AppDelegate.shared?.openLoginPage()
    }
    
    private func drawDesign() {
        self.indicator.startAnimating()
        DispatchQueue.main.async {
            self.view.backgroundColor = .systemPink
            self.createSplashImg()
            self.createIndicator()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.indicator.stopAnimating()
                self.openLoginVC()
            })
        }
    }
    
}

// MARK: - UI Components Constraints Extension
extension SplashScreen {
    
    private func createSplashImg() {
        splashImg.backgroundColor = AppColors.white
        splashImg.image = UIImage(named: "launch_screen")
        splashImg.contentMode = .scaleAspectFit
        splashImg.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func createIndicator() {
        indicator.backgroundColor = AppColors.backgroundColor
        indicator.color = AppColors.white
        indicator.alpha = 0.8
        indicator.addCornerRadius(radius: 8)
        indicator.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.width.equalTo(56)
        }
    }
    
}
