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
    
    public var didCartSuccess: ()->() = { }
    public var didProductSuccess: ()->() = { }
    public var didPaymentSuccess: ()->() = { }
    public var didFailure: (Error)->() = { _ in }
    
    lazy var group = DispatchGroup()
    lazy var paymentGroup = DispatchGroup()
    let queue = DispatchQueue(label: "removeCart", attributes: .concurrent)
    
    private var cartData: CartResponseModel?
    var productList: [ProductCartModel] = []
    
    func cartListRequest() {
        CartRequest.shared.cartRequest { [weak self] data in
            guard let self = self else { return }
            if let data = data {
                self.cartData = data
                cartData?.forEach({ item in
                    item.products?.forEach({ product in
                        self.productRequest(productId: product.productId ?? 0, quantity: product.quantity ?? 0)
                    })
                })
                self.didCartSuccess()
            } else {
                self.didFailure(ErrorType.invalidData)
            }
        }
    }
    
    func productRequest(productId: Int, quantity: Int) {
        queue.async {
            self.group.enter()
            ProductRequest.shared.productRequest(productId: productId) { [weak self] data in
                guard let self = self else { return }
                defer {
                    self.group.leave()
                }
                if let data = data {
                    productList.append(ProductCartModel(product: data, quantity: quantity))
                } else {
                    self.didFailure(ErrorType.invalidData)
                }
            }
            self.group.wait()
            self.group.notify(queue: .main) {
                self.didProductSuccess()
            }
        }
    }
    
    func paymentRequest() {
        productList.forEach { item in
            paymentGroup.enter()
            PaymentRequest.shared.paymentRequest(id: item.product.id ?? 0) { [weak self] data in
                guard let self = self else { return }
                defer {
                    self.paymentGroup.leave()
                }
                if let data = data {
                    print(data)
                    self.didPaymentSuccess()
                } else {
                    self.didFailure(ErrorType.invalidData)
                }
            }
        }
    }
    
}
