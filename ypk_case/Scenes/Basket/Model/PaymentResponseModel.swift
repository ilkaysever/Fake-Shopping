//
//  PaymentResponseModel.swift
//  ypk_case
//
//  Created by İlkay Sever on 19.08.2023.
//

import Foundation

struct PaymentResponseModel: Codable {
    var id: Int?
    var userID: Int?
    var date: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case date
    }
}
