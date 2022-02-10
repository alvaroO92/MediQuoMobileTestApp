//
//  HomeSearchBuilderTests.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import XCTest
@testable import MediQuoMobileTestApp

class HomeSearchBuilderTests: XCTestCase {

    var sut: HomeSearchBuilderMock!
    
    override func setUp() {
        sut = HomeSearchBuilderMock()
    }

    override func tearDown() {
     sut = nil
    }

    func testSutIsNotNil() {
        XCTAssertNotNil(sut)
    }

    func testBuildLoaded() {
        // When
        sut.build()
        // Then
        XCTAssertTrue(sut.builderCount > 0)
    }
}
