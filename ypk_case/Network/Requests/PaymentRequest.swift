//
//  PaymentRequest.swift
//  ypk_case
//
//  Created by İlkay Sever on 19.08.2023.
//

import Foundation

final class PaymentRequest {
    
    static let shared = PaymentRequest()
    
    func paymentRequest(id: Int, completion: @escaping (PaymentResponseModel?) -> ()) {
        guard let url = URL(string: "\(Constants.BASE_URL)" + "/carts/\(id)") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.headers = ["Content-Type" : "application/json"]
        urlRequest.httpMethod = HttpMethods.delete.rawValue
        NetworkManager.shared.request(type: PaymentResponseModel.self, url: urlRequest) { [weak self] response in
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
