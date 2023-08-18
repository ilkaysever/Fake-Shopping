//
//  ProductDetailViewController.swift
//  ypk_case
//
//  Created by İlkay Sever on 18.08.2023.
//

import UIKit

final class ProductDetailViewController: BaseViewController {
    
    // MARK: - UI Components
    private let containerView: UIView = UIView()
    private let backButton: UIButton = UIButton()
    private let productImg: UIImageView = UIImageView()
    private let starImg: UIImageView = UIImageView()
    private let rateLabel: UILabel = UILabel()
    private let priceLabel: UILabel = UILabel()
    private let basketButton: UIButton = UIButton()
    private let titleLabel: UILabel = UILabel()
    private let descLabel: UILabel = UILabel()
    
    // MARK: - Variables
    var detailData: ProductResponseModelElement!
    
    // MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - Configure UI Elements
    private func configureUI() {
        view.addSubview(containerView)
        containerView.addSubviews(productImg, starImg, rateLabel, titleLabel, descLabel, priceLabel, basketButton)
        self.view.addSubview(backButton)
        drawDesign()
    }
    
    private func drawDesign() {
        DispatchQueue.main.async {
            self.mainView()
            self.productInfo()
            self.buttons()
        }
    }
    
    @objc private func didTappedBasket() {
        print("sepete ekleme fonsiyonu gelicek")
        navigationController?.popViewController(animated: true)
        self.tabBarController?.selectedIndex = 1;
    }
    
}

// MARK: - UI Components Constraints Extension
extension ProductDetailViewController {
    
    private func mainView() {
        // ContainerView
        containerView.backgroundColor = AppColors.backgroundColor
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        // Product Image
        //productImg.setImageUrl(imageUrl: detailData.image ?? "")
        productImg.setImage(with: detailData.image ?? "")
        productImg.contentMode = .scaleToFill
        productImg.backgroundColor = .clear
        productImg.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top)
            make.left.equalTo(containerView.snp.left)
            make.right.equalTo(containerView.snp.right)
            make.height.equalTo(view.frame.height / 2)
        }
        
        // Rate Logo Image
        starImg.image = UIImage(systemName: "star.fill")
        starImg.tintColor = .orange
        starImg.contentMode = .scaleAspectFill
        starImg.backgroundColor = .clear
        starImg.snp.makeConstraints { (make) in
            make.top.equalTo(productImg.snp.bottom).offset(8)
            make.left.equalTo(containerView.snp.left).offset(16)
            make.width.height.equalTo(24)
        }
        
        // Rate Label
        rateLabel.text = "\(detailData.rating?.rate ?? 0.0)"
        rateLabel.textAlignment = .left
        rateLabel.textColor = AppColors.white
        rateLabel.font = AppFonts.UbuntuMedium14
        rateLabel.snp.makeConstraints { (make) in
            make.left.equalTo(starImg.snp.right).offset(8)
            make.centerY.equalTo(starImg.snp.centerY)
        }
        
        // Price Label
        priceLabel.text = "$" + "\(detailData.price ?? 0.0)"
        priceLabel.textAlignment = .right
        priceLabel.textColor = AppColors.white
        priceLabel.font = AppFonts.UbuntuMedium16
        priceLabel.snp.makeConstraints { (make) in
            make.right.equalTo(containerView.snp.right).offset(-8)
            make.centerY.equalTo(rateLabel.snp.centerY)
        }
        
    }
    
    private func productInfo() {
        
        // Product Title
        titleLabel.text = detailData.title
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.textColor = AppColors.white
        titleLabel.font = AppFonts.UbuntuBold16
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(starImg.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        // Desc Label
        descLabel.text = detailData.description
        descLabel.textAlignment = .left
        descLabel.numberOfLines = 0
        descLabel.textColor = AppColors.white
        descLabel.font = AppFonts.UbuntuRegular14
        descLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
    }
    
    private func buttons() {
        // Add To Basket Button
        basketButton.backgroundColor = AppColors.borderColor
        basketButton.setTitle("Sepete Ekle", for: .normal)
        basketButton.tintColor = AppColors.white
        basketButton.titleLabel?.font = AppFonts.UbuntuMedium16
        basketButton.addCornerRadius(radius: 8)
        basketButton.addTarget(self, action: #selector(didTappedBasket), for: .touchUpInside)
        basketButton.snp.makeConstraints { make in
            make.bottom.equalTo(containerView.snp.bottom).offset(-16)
            make.left.equalTo(containerView.snp.left).offset(16)
            make.right.equalTo(containerView.snp.right).offset(-16)
            make.height.equalTo(56)
        }
        
        // Back Button
        backButton.backgroundColor = AppColors.backgroundColor
        backButton.alpha = 0.5
        backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backButton.tintColor = AppColors.white
        backButton.addCornerRadius(radius: 4)
        backButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(50)
            make.left.equalTo(containerView.snp.left).offset(16)
            make.height.width.equalTo(44)
        }
        
    }
    
}
