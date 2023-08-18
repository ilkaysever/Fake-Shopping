//
//  ProductViewModel.swift
//  ypk_case
//
//  Created by İlkay Sever on 18.08.2023.
//

import Foundation

protocol ProductViewModelProtocol: AnyObject {
    func productListRequest()
}

final class ProductViewModel: ProductViewModelProtocol {
    
    public var didSuccess: ()->() = { }
    public var didFailure: (Error)->() = { _ in }
    
    private var productData: ProductResponseModel?
    
    func productListRequest() {
        ProducListRequest.shared.productListRequest { [weak self] data in
            guard let self = self else { return }
            if let data = data {
                self.productData = data
                print(productData ?? [])
                self.didSuccess()
            } else {
                self.didFailure(ErrorType.invalidData)
            }
        }
    }
    
    func getProductList() -> ProductResponseModel {
        return productData ?? []
    }
    
}
