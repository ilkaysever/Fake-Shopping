//
//  ProductRequest.swift
//  ypk_case
//
//  Created by İlkay Sever on 19.08.2023.
//

import Foundation

//https://fakestoreapi.com/products/1

final class ProductRequest {
    
    static let shared = ProductRequest()
    
    func productRequest(productId: Int, completion: @escaping (ProductResponseModelElement?) -> ()) {
        guard let url = URL(string: "\(Constants.BASE_URL)" + "/products/\(productId)") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.headers = ["Content-Type" : "application/json"]
        urlRequest.httpMethod = HttpMethods.get.rawValue
        NetworkManager.shared.request(type: ProductResponseModelElement.self, url: urlRequest) { [weak self] response in
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
