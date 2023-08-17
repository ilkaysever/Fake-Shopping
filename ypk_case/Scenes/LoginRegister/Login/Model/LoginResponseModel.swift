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


//{
//    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIsInVzZXIiOiJtb3JfMjMxNCIsImlhdCI6MTY5MjMwMTkyM30.YMSMWghUtjlwPk--AtJRgo9ngEbJlgv6b1Nw_MoCKkI"
//}
