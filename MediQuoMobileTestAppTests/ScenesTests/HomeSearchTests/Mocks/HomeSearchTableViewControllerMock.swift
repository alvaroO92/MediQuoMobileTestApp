//
//  HomeSearchTableViewControllerMock.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit
@testable import MediQuoMobileTestApp

final class HomeSearchTableViewControllerMock: HomeSearchTableViewControllerProtocol {
    
    private(set) var setupUICount: Int = 0
    private(set) var reloadViewCount: Int = 0
    private(set) var showErrorViewCount: Int = 0

    func setupUI() {
        setupUICount += 1
    }
    
    func reloadView() {
        reloadViewCount += 1
    }
    
    func showErrorView(message: String) {
        showErrorViewCount += 1
    }
}
