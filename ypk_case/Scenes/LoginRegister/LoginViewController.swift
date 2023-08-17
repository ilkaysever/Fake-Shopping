//
//  LoginViewController.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import UIKit

final class LoginViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let welcomeLabel: UILabel = UILabel()
    private let titleLabel: UILabel = UILabel()
    private let backgroundImg: UIImageView = UIImageView()
    private let logoImg: UIImageView = UIImageView()
    private let loginStackView: UIStackView = UIStackView()
    private let emailContainer: UIView = UIView()
    private let emailLogo: UIImageView = UIImageView()
    private let emailTxtField: UITextField = UITextField()
    private let passwordContainer: UIView = UIView()
    private let passwordLogo: UIImageView = UIImageView()
    private let passwordTxtField: UITextField = UITextField()
    private let registerLabel: UILabel = UILabel()
    private let loginButton: UIButton = UIButton()
    
    
    // MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupLabelTap()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    // MARK: - Configure UI Elements
    
    private func configureUI() {
        view.addSubviews(backgroundImg, welcomeLabel, titleLabel, logoImg, /*loginStackView*/ emailContainer, passwordContainer, loginButton, registerLabel)
        drawDesign()
    }
    
    private func drawDesign() {
        DispatchQueue.main.async {
            self.view.backgroundColor = AppColors.white
            self.createBackground()
            self.createWelcomeTitle()
            self.createTitle()
            self.createLogo()
            //self.createLoginStack()
            self.createEmailView()
            self.createPasswordView()
            self.createLoginButton()
            self.createRegisterLabel()
        }
    }
    
    private func setupLabelTap() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.didTappedRegisterLabel(_:)))
        registerLabel.isUserInteractionEnabled = true
        registerLabel.addGestureRecognizer(labelTap)
    }
    
    private func openRegister() {
        let vc = RegisterViewController()
        let nav = BaseNavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .overFullScreen
        self.present(nav, animated: true)
    }
    
    @objc func didTappedRegisterLabel(_ sender: UITapGestureRecognizer) {
        openRegister()
    }
    
    @objc private func didTappedLogin() {
        print("login basıldı")
    }
    
}

// MARK: - UI Components Constraints Extension
extension LoginViewController {
    
    private func createBackground() {
        backgroundImg.image = UIImage(named: "login_register_rectangle")
        backgroundImg.contentMode = .scaleAspectFill
        backgroundImg.backgroundColor = .clear
        backgroundImg.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
    
    private func createWelcomeTitle() {
        welcomeLabel.text = "Welcome to"
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = AppColors.backgroundColor
        welcomeLabel.font = AppFonts.UbuntuMedium14
        welcomeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }
    }
    
    private func createTitle() {
        titleLabel.text = "Yapı Kredi Teknoloji Case"
        titleLabel.textAlignment = .center
        titleLabel.textColor = AppColors.backgroundColor
        titleLabel.font = AppFonts.UbuntuBold18
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }
    }
    
    private func createLogo() {
        logoImg.image = UIImage(named: "hero_logo")
        logoImg.contentMode = .scaleAspectFill
        logoImg.backgroundColor = .clear
        logoImg.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.top).offset(32)
            make.width.height.equalTo(170)
            make.centerX.equalToSuperview()
        }
    }
    
    //    private func createLoginStack() {
    //        loginStackView.backgroundColor = .red
    //        loginStackView.alignment = .fill
    //        loginStackView.axis = .vertical
    //        loginStackView.distribution = .fillEqually
    //        loginStackView.spacing = 8
    //        loginStackView.snp.makeConstraints { make in
    //            make.top.equalTo(logoImg.snp.bottom).offset(24)
    //            make.left.equalToSuperview().offset(16)
    //            make.right.equalToSuperview().offset(-16)
    //            make.bottom.equalToSuperview().offset(-24)
    //        }
    //    }
    
    private func createEmailView() {
        emailContainer.backgroundColor = .clear
        emailContainer.addCornerRadius(radius: 8)
        emailContainer.addBorderView(width: 1, color: AppColors.borderColor)
        emailContainer.snp.makeConstraints { make in
            make.top.equalTo(logoImg.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(56)
        }
    }
    
    private func createPasswordView() {
        passwordContainer.backgroundColor = .clear
        passwordContainer.addCornerRadius(radius: 8)
        passwordContainer.addBorderView(width: 1, color: AppColors.borderColor)
        passwordContainer.snp.makeConstraints { make in
            make.top.equalTo(emailContainer.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(56)
        }
    }
    
    private func createLoginButton() {
        loginButton.backgroundColor = AppColors.borderColor
        loginButton.setTitle("GİRİŞ YAP", for: .normal)
        loginButton.tintColor = AppColors.white
        loginButton.titleLabel?.font = AppFonts.UbuntuMedium16
        loginButton.addCornerRadius(radius: 8)
        loginButton.addTarget(self, action: #selector(didTappedLogin), for: .touchUpInside)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordContainer.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(56)
        }
    }
    
    private func createRegisterLabel() {
        registerLabel.textColor = AppColors.backgroundColor
        registerLabel.textAlignment = .left
        registerLabel.font = AppFonts.UbuntuMedium14
        let joinUsFullText: String = "Henüz üye olmadınız mı?  Hemen üye ol."
        registerLabel.halfTextColorChange(fullText: joinUsFullText, changeText: "Hemen üye ol.")
        registerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(loginButton.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
}
