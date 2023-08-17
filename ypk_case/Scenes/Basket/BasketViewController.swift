//
//  BasketViewController.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import UIKit

final class BasketViewController: BaseViewController {
    
    private let confirmButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(confirmButton)
        drawDesign()
    }
    
    private func drawDesign() {
        DispatchQueue.main.async {
            self.view.backgroundColor = .systemPink
            self.createConfirmButton()
        }
    }
    
    @objc private func didTappedConfirm() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
}

extension BasketViewController {
    
    private func createConfirmButton() {
        confirmButton.setTitle("Satın Al", for: .normal)
        confirmButton.backgroundColor = .blue
        confirmButton.addCornerRadius(radius: 8)
        confirmButton.addTarget(self, action: #selector(didTappedConfirm), for: .touchUpInside)
        confirmButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(56)
        }
    }
    
}
