//
//  UIImageView+Extension.swift
//  ypk_case
//
//  Created by İlkay Sever on 18.08.2023.
//

import Kingfisher

//extension UIImageView {
//
//    func setImageUrl(imageUrl: String) {
//        if let url = URL(string: ((imageUrl))) {
//            self.kf.indicatorType = .activity
//            self.kf.setImage(with: url, placeholder: UIImage(named: ""))
//        }
//    }
//
//}

extension UIImageView {
    
    func setImage(with urLString: String) {
        guard let url = URL.init(string: urLString) else { return }
        let resource = ImageResource(downloadURL: url, cacheKey: urLString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
    
}
