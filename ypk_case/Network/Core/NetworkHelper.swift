//
//  NetworkHelper.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import Foundation

struct Constants {
    static let BASE_URL = "https://randomuser.me/api/?results="
}

enum ErrorType: String, Error {
    case invalidData = "Invalid Data"
    case invalidURL = "Inlavid Url"
    case unknownError = "An error unknown"
}

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
}
