//
//  SearchDetailBuilderTests.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import XCTest
@testable import MediQuoMobileTestApp

class SearchDetailBuilderTests: XCTestCase {
    
    var sut: SearchDetailBuilderMock!
    
    override func setUp() {
        sut = SearchDetailBuilderMock()
    }

    override func tearDown() {
     sut = nil
    }

    func testSutIsNotNil() {
        XCTAssertNotNil(sut)
    }

    func testBuildLoaded() {
        // When
        sut.build(searchCategory: .BetterCallSaul, character: Character(id: 0, name: "", birthday: "", occupation: [], image: "", status: "", appearance: [], nickname: "", portrayed: ""))
        // Then
        XCTAssertTrue(sut.builderCount > 0)
    }
}
