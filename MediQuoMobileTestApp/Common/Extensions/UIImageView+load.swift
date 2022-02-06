//
//  UIImageView+load.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 5/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func loadFromSDWebImage(urlString: String) {
        if let url = URL(string: urlString) {
            self.sd_imageIndicator = SDWebImageActivityIndicator.gray
            self.sd_setImage(with: url)
        }
    }
}
