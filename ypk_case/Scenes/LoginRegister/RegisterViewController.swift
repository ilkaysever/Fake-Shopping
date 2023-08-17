//
//  RegisterViewController.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import UIKit

final class RegisterViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle(title: "Üye Ol")
        addRightButton(selector: #selector(didTappedDismiss), image: "close_icon")
        //setupUI()
    }


}
