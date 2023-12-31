//
//  NetworkManager.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<T: Codable>(type: T.Type, url: URLRequest, completion: @escaping((Result<T, ErrorType>) -> ())) {
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                self.handleResponse(data: data!) { response in
                    completion(response)
                }
            case .failure(_):
                completion(.failure(.invalidData))
            }
        }
    }
    
    private func handleResponse<T: Codable>(data: Data, completion: @escaping((Result<T, ErrorType>) -> ())) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.networkMessage(error)))
        }
    }
    
}
