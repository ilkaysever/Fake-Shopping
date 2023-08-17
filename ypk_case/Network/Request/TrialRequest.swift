//
//  TrialRequest.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

//import Foundation
//
//class TrialRequest {
//    
//    static let shared = TrialRequest()
//    
//    func friendListRequest(results: Int, completion: @escaping (FriendResponseModel?) -> ()) {
//        guard let url = URL(string: "\(Constants.BASE_URL)" + "\(results)") else { return }
//        NetworkManager.shared.request(type: FriendResponseModel.self, url: url, method: .get) { [weak self] response in
//            guard let self = self else { return }
//            switch response {
//            case .success(let data):
//                completion(data)
//            case .failure(let error):
//                self.handleWithError(error)
//            }
//        }
//    }
//    
//    
//    private func handleWithError(_ error: Error) {
//        debugPrint(error.localizedDescription)
//    }
//    
//}
