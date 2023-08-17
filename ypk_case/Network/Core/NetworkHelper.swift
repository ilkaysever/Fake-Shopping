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

enum ErrorType: String, Error {
    case invalidData = "Invalid Data"
    case invalidURL = "Inlavid Url"
    case unknownError = "An error unknown"
}

enum HttpMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case update = "UPDATE"
}

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
}
