//
//  HomeSearchRouterTests.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import XCTest
@testable import MediQuoMobileTestApp

class HomeSearchRouterTests: XCTestCase {
    
    var sut: HomeSearchRouterMock!
    
    override func setUp() {
        sut = HomeSearchRouterMock()
    }

    override func tearDown() {
     sut = nil
    }

    func testSutIsNotNil() {
        XCTAssertNotNil(sut)
    }

    func testGoToDetailLoaded() {
        // When
        sut.goToDetail(with: .BetterCallSaul, character: Character(id: 0, name: "", birthday: "", occupation: [], image: "", status: "", appearance: [], nickname: "", portrayed: ""))
        // Then
        XCTAssertTrue(sut.goToDetailCount > 0)
    }
}
