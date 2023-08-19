//
//  CartRequest.swift
//  ypk_case
//
//  Created by İlkay Sever on 19.08.2023.
//

import Foundation

final class CartRequest {
    
    static let shared = CartRequest()
    
    func cartRequest(completion: @escaping (CartResponseModel?) -> ()) {
        guard let url = URL(string: "\(Constants.BASE_URL)" + "/carts") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HttpMethods.get.rawValue
        NetworkManager.shared.request(type: CartResponseModel.self, url: urlRequest) { [weak self] response in
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
