//
//  LoginViewModel.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import Foundation

final class LoginViewModel: BaseViewModel {
    
    public var didSuccess: ()->() = { }
    public var didFailure: (Error)->() = { _ in }
    
    private var loginData: LoginResponseModel?
    private var token = ""
    
    func loginRequest(username: String, password: String, completion: @escaping ResultModelClosure) {
        LoginRequest.shared.loginRequest(reqModel: LoginRequestModel(username: username,
                                                                     password: password)) { [weak self] response in
            guard let self = self else { return }
            if let response = response, let token = response.token {
                self.loginData = response
                self.token = token
                completion(.success(""))
            } else {
                completion(.failure(.invalidData))
            }
        }
    }
    
//    func tutorialRequest(tutorialType: Int, completion: @escaping ResultModelClosure) {
//        TutorialRequest(trailerVideoType: tutorialType).request { [weak self] response in
//            guard let self = self else { return }
//            self.tutorialData = response?.entity
//            completion(.success(""))
//        } failure: { error in
//            completion(.failure(error))
//            MessagesPresenter.shared.showMessage(image: "custom_alert_wing_icon", backGroundColor: AppColors.red01Dark, title: error.message, detail: "")
//        }
//    }
    
    func getToken() -> String {
        return token
    }
    
}
