//
//  HomeSearchRouterMock.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//

import UIKit
@testable import MediQuoMobileTestApp

final class HomeSearchRouterMock: HomeSearchRouterProtocol {

    private(set) var goToDetailCount: Int = 0
    
    func goToDetail(with searchCategory: SearchCategory, character: Character) {
        goToDetailCount += 1
    }
}
