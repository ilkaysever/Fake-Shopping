//
//  NetworkHelper.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import Foundation

struct Constants {
    static let BASE_URL = "https://fakestoreapi.com"
}

enum ErrorType: Error {
    case invalidData
    case invalidURL
    case unknownError
    case networkMessage(Error?)
}

enum HttpMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case update = "UPDATE"
    case delete = "DELETE"
}

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
}
