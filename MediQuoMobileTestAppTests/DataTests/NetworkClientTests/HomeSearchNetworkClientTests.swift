//
//  HomeSearchNetworkClientTests.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import XCTest

class HomeSearchNetworkClientTests: XCTestCase {

    var sut: HomeSearchNetworkClientMock!
    
    override func setUp() {
        sut = HomeSearchNetworkClientMock()
    }

    override func tearDown() {
        sut = nil
    }

    func testSutIsNotNil() {
        XCTAssertNotNil(sut)
    }

    func testCharactersResponseSuccess() {
        // Given
        let expectation = XCTestExpectation(description: #function)
        // When
        sut.getCharacters { _ in
            expectation.fulfill()
        }
        // Then
        wait(for: [expectation], timeout: 1.0)
    }
}
