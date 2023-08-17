//
//  LoginViewModel.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    func loginRequest(username: String, password: String)
}

final class LoginViewModel: LoginViewModelProtocol {
    
    public var didSuccess: ()->() = { }
    public var didFailure: (String)->() = { _ in }
    
    private var loginData: LoginResponseModel?
    private var token = ""
    
    func loginRequest(username: String, password: String) {
        LoginRequest.shared.loginRequest(reqModel: LoginRequestModel(username: username, password: password)) { [weak self] data in
            guard let self = self else { return }
            if let data = data, let token = data.token {
                self.loginData = data
                self.token = token
                print(token)
                self.didSuccess()
            } else {
                self.didFailure(ErrorType.invalidData.rawValue)
            }
        }
    }
    
    func getToken() -> String {
        return token
    }
    
}
