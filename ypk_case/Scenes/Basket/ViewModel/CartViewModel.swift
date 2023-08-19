//
//  CartViewModel.swift
//  ypk_case
//
//  Created by İlkay Sever on 19.08.2023.
//

import Foundation

protocol CartViewModelProtocol: AnyObject {
    func cartListRequest()
}

final class CartViewModel: CartViewModelProtocol {
    
    public var didSuccess: ()->() = { }
    public var didFailure: (Error)->() = { _ in }
    
    var group = DispatchGroup()
    var paymentGroup = DispatchGroup()
    
    private var cartData: CartResponseModel?
    var productList: [ProductCartModel] = []
    
    func cartListRequest() {
        CartRequest.shared.cartRequest { [weak self] data in
            guard let self = self else { return }
            if let data = data {
                self.cartData = data
                cartData?.forEach({ item in
                    item.products?.forEach({ product in
                        self.productRequest(productId: product.productId ?? 0,
                                            quantity: product.quantity ?? 0)
                    })
                })
                self.didSuccess()
            } else {
                self.didFailure(ErrorType.invalidData)
            }
        }
    }
    
    func productRequest(productId: Int, quantity: Int) {
        group.enter()
        ProductRequest.shared.productRequest(productId: productId) { [weak self] data in
            guard let self = self else { return }
            if let data = data {
                productList.append(ProductCartModel(product: data, quantity: quantity))
                self.didSuccess()
                self.group.leave()
            } else {
                self.didFailure(ErrorType.invalidData)
                self.group.leave()
            }
        }
    }
    
    func paymentRequest() {
        productList.forEach { item in
            paymentGroup.enter()
            PaymentRequest.shared.paymentRequest(id: item.product.id ?? 0) { [weak self] data in
                guard let self = self else { return }
                if let data = data {
                    print(data)
                    self.didSuccess()
                    self.paymentGroup.leave()
                } else {
                    self.didFailure(ErrorType.invalidData)
                    self.paymentGroup.leave()
                }
            }
        }
    }
    
}
