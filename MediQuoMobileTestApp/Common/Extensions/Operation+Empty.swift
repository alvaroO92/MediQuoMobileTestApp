//
//  Operation+Empty.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 5/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation

extension Array {
    var isNotEmpty: Bool {
        !self.isEmpty
    }
}

extension String {
    var isNotEmpty: Bool {
        !self.isEmpty
    }
}
