//
//  ProductTableCell.swift
//  ypk_case
//
//  Created by İlkay Sever on 18.08.2023.
//

import UIKit

final class ProductTableCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    private func configureUI() {
        containerView.addCornerRadius(radius: 8)
    }
    
    func configureProductCard(_ productModel: ProductResponseModelElement?, quantity: Int? = nil) {
        guard let imgUrl = productModel?.image,
              let title = productModel?.title,
              let desc = productModel?.description,
              let price = productModel?.price else { return }
        productImg.setImage(with: imgUrl)
        titleLabel.text = title
        descLabel.text = desc
        priceLabel.text = "$" + "\(price)"
        if let quantity = quantity {
            quantityLabel.text = "Adet: \(quantity)"
        } else {
            quantityLabel.isHidden = true
        }
    }
    
}
