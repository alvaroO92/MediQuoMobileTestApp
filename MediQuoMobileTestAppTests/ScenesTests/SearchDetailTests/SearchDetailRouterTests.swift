//
//  SearchDetailRouterTests.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import XCTest
@testable import MediQuoMobileTestApp

class SearchDetailRouterTests: XCTestCase {
    
    var sut: SearchDetailRouterMock!
    
    override func setUp() {
        sut = SearchDetailRouterMock()
    }

    override func tearDown() {
     sut = nil
    }

    func testSutIsNotNil() {
        XCTAssertNotNil(sut)
    }
}
