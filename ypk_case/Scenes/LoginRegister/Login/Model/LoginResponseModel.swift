//
//  LoginResponseModel.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

struct LoginResponseModel: Codable {
    
    var token: String?
    
    enum CodingKeys: String, CodingKey {
        case token
    }
    
}
