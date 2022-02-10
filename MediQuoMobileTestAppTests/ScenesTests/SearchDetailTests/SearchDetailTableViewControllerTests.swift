//
//  SearchDetailTableViewControllerTests.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//

import XCTest
@testable import MediQuoMobileTestApp

class SearchDetailTableViewControllerTests: XCTestCase {
    
    var sut: SearchDetailTableViewControllerMock!
    
    override func setUp() {
        sut = SearchDetailTableViewControllerMock()
    }

    override func tearDown() {
        sut = nil
    }

    func testSutIsNotNil() {
        XCTAssertNotNil(sut)
    }

    func testSetupUILoaded() {
        // When
        sut.setupUI()
        // Then
        XCTAssertTrue(sut.setupUICount > 0)
    }

    func testReloadViewLoaded() {
        // When
        sut.reloadView()
        // Then
        XCTAssertTrue(sut.reloadViewCount > 0)
    }
}
