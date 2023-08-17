//
//  ProductResponseModel.swift
//  ypk_case
//
//  Created by İlkay Sever on 18.08.2023.
//

struct ProductResponseModelElement: Codable {
    var id: Int?
    var title: String?
    var price: Double?
    var description: String?
    var category: Category?
    var image: String?
    var rating: Rating?
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

struct Rating: Codable {
    var rate: Double?
    var count: Int?
}

typealias ProductResponseModel = [ProductResponseModelElement]
