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
    private let userNameContainer: UIView = UIView()
    private let emailLogo: UIImageView = UIImageView()
    private let userNameTxtField: UITextField = UITextField()
    private let passwordContainer: UIView = UIView()
    private let passwordLogo: UIImageView = UIImageView()
    private let passwordTxtField: UITextField = UITextField()
    private let registerLabel: UILabel = UILabel()
    private let loginButton: UIButton = UIButton()
    
    
    // MARK: - Variables
    let viewModel = LoginViewModel()
    
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
        userNameContainer.addSubviews(emailLogo)
        view.addSubviews(backgroundImg, welcomeLabel, titleLabel, logoImg, userNameContainer, passwordContainer, loginButton)
        userNameContainer.addSubviews(userNameTxtField)
        passwordContainer.addSubviews(passwordTxtField)
        drawDesign()
    }
    
    private func drawDesign() {
        DispatchQueue.main.async {
            self.view.backgroundColor = AppColors.white
            self.mainView()
            self.userNameField()
            self.passwordField()
            self.loginRegisterFields()
        }
    }
    
    // MARK: - Request
    private func loginRequest(username: String, password: String) {
        viewModel.loginRequest(username: username, password: password) { result in
            switch result {
            case .success(_):
                print("TOKEN: " + "\(self.viewModel.getToken())")
                AppDelegate.shared?.openMainPage()
            case .failure(let error):
                print(error)
            }
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
        loginRequest(username: "mor_2314", password: "83r5^_")
    }
    
}

// MARK: - UI Components Constraints Extension
extension LoginViewController {
    
    private func mainView() {
        // Background Image
        backgroundImg.image = UIImage(named: "login_register_rectangle")
        backgroundImg.contentMode = .scaleAspectFill
        backgroundImg.backgroundColor = .clear
        backgroundImg.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        // Welcome Title
        welcomeLabel.text = "Welcome to"
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = AppColors.backgroundColor
        welcomeLabel.font = AppFonts.UbuntuMedium14
        welcomeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }
        
        // Brand Title
        titleLabel.text = "Fake Shopping App"
        titleLabel.textAlignment = .center
        titleLabel.textColor = AppColors.backgroundColor
        titleLabel.font = AppFonts.UbuntuBold18
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }
        
        // Main Logo Image
        logoImg.image = UIImage(named: "hero_logo")
        logoImg.contentMode = .scaleAspectFill
        logoImg.backgroundColor = .clear
        logoImg.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.width.height.equalTo(170)
            make.centerX.equalToSuperview()
        }
    }
    
    private func userNameField() {
        // User Name ContainerView
        userNameContainer.backgroundColor = .clear
        userNameContainer.addCornerRadius(radius: 8)
        userNameContainer.addBorderView(width: 1, color: AppColors.borderColor)
        userNameContainer.snp.makeConstraints { make in
            make.top.equalTo(logoImg.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(56)
        }
        
        // User Name Text Field
        userNameTxtField.backgroundColor = .clear
        userNameTxtField.isUserInteractionEnabled = false
        userNameTxtField.text = "mor_2314"
        userNameTxtField.textColor = AppColors.backgroundColor
        userNameTxtField.font = AppFonts.UbuntuRegular14
        userNameTxtField.snp.makeConstraints { make in
            make.top.equalTo(userNameContainer.snp.top).offset(8)
            make.left.equalTo(userNameContainer.snp.left).offset(16)
            make.right.equalTo(userNameContainer.snp.right).offset(-16)
            make.bottom.equalTo(userNameContainer.snp.bottom).offset(-8)
        }
    }
    
    private func passwordField() {
        // Password Container View
        passwordContainer.backgroundColor = .clear
        passwordContainer.addCornerRadius(radius: 8)
        passwordContainer.addBorderView(width: 1, color: AppColors.borderColor)
        passwordContainer.snp.makeConstraints { make in
            make.top.equalTo(userNameContainer.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(56)
        }
        
        // Password Text Field
        passwordTxtField.backgroundColor = .clear
        passwordTxtField.isUserInteractionEnabled = false
        passwordTxtField.text = "83r5^_"
        passwordTxtField.textColor = AppColors.backgroundColor
        passwordTxtField.font = AppFonts.UbuntuRegular14
        passwordTxtField.snp.makeConstraints { make in
            make.top.equalTo(passwordContainer.snp.top).offset(8)
            make.left.equalTo(passwordContainer.snp.left).offset(16)
            make.right.equalTo(passwordContainer.snp.right).offset(-16)
            make.bottom.equalTo(passwordContainer.snp.bottom).offset(-8)
        }
    }
    
    private func loginRegisterFields() {
        // Login Button
        loginButton.backgroundColor = AppColors.borderColor
        loginButton.setTitle("Giriş Yap", for: .normal)
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
        
        // Register Label
        //        registerLabel.textColor = AppColors.backgroundColor
        //        registerLabel.textAlignment = .left
        //        registerLabel.font = AppFonts.UbuntuMedium14
        //        let joinUsFullText: String = "Henüz üye olmadınız mı?  Hemen üye ol."
        //        registerLabel.halfTextColorChange(fullText: joinUsFullText, changeText: "Hemen üye ol.")
        //        registerLabel.snp.makeConstraints { (make) in
        //            make.top.equalTo(loginButton.snp.bottom).offset(16)
        //            make.left.equalToSuperview().offset(16)
        //            make.right.equalToSuperview().offset(-16)
        //        }
    }
    
}
