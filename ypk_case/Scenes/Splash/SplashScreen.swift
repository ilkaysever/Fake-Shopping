//
//  SplashScreen.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import UIKit

final class SplashScreen: BaseViewController {
    
    private let splashImg: UIImageView = UIImageView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubviews(splashImg, indicator)
        drawDesign()
    }
    
    private func drawDesign() {
        self.indicator.startAnimating()
        DispatchQueue.main.async {
            self.view.backgroundColor = .systemPink
            self.createSplashImg()
            self.createIndicator()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.indicator.stopAnimating()
            })
        }
    }
    
}

extension SplashScreen {
    
    private func createSplashImg() {
        splashImg.backgroundColor = .blue
        splashImg.image = UIImage(named: "launch_screen")
        splashImg.contentMode = .scaleAspectFill
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