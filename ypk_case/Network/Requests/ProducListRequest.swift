//
//  ProducListRequest.swift
//  ypk_case
//
//  Created by İlkay Sever on 18.08.2023.
//

import Foundation

class ProducListRequest {
    
    static let shared = ProducListRequest()
    
    func productListRequest(completion: @escaping (ProductResponseModel?) -> ()) {
        guard let url = URL(string: "\(Constants.BASE_URL)" + "/products") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HttpMethods.get.rawValue
        NetworkManager.shared.request(type: ProductResponseModel.self, url: urlRequest) { [weak self] response in
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
