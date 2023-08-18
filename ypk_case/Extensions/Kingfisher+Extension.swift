//
//  Kingfisher+Extension.swift
//  ypk_case
//
//  Created by İlkay Sever on 18.08.2023.
//

import Kingfisher

extension UIImageView {
    
    func setImageUrl(imageUrl: String) {
        if let url = URL(string: ((imageUrl))) {
            self.kf.indicatorType = .activity
            self.kf.setImage(with: url, placeholder: UIImage(named: ""))
        }
    }
    
}
