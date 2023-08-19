//
//  LoginRequest.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import Foundation

final class LoginRequest {
    
    static let shared = LoginRequest()
    
    func loginRequest(reqModel: LoginRequestModel, completion: @escaping (LoginResponseModel?) -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)" + "/auth/login") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.headers = ["Content-Type" : "application/json"]
        urlRequest.httpMethod = HttpMethods.post.rawValue
        let encoder = JSONEncoder()
        let data = try? encoder.encode(reqModel)
        urlRequest.httpBody = data
        NetworkManager.shared.request(type: LoginResponseModel.self, url: urlRequest) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                completion(data)
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    private func handleWithError(_ error: Error) {
        debugPrint(error.localizedDescription)
    }
    
}
