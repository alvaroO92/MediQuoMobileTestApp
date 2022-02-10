//
//  HomeSearchBuilderMock.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import UIKit
@testable import MediQuoMobileTestApp

final class HomeSearchBuilderMock: Builder {
    private(set) var builderCount: Int = 0

    @discardableResult
    func build() -> UIViewController {
        builderCount += 1
        return UIViewController()
    }
}
