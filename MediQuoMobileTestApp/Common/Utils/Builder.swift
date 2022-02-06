//
//  Builder.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 4/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

protocol Builder: AnyObject {
    func build() -> UIViewController
}

extension Builder {
    func build() { }    
}
