//
//  CartResponseModel.swift
//  ypk_case
//
//  Created by İlkay Sever on 19.08.2023.
//

import Foundation

struct CartResponseModelElement: Codable {
    var id: Int?
    var userId: Int?
    var date: String?
    var products: [Product]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId
        case date
        case products
    }
}

struct Product: Codable {
    var productId: Int?
    var quantity: Int?
    
    enum CodingKeys: String, CodingKey {
        case productId
        case quantity
    }
}

typealias CartResponseModel = [CartResponseModelElement]

