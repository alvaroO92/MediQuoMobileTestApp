//
//  HomeSearchTableViewControllerTests.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//

import XCTest

class HomeSearchTableViewControllerTests: XCTestCase {

    var sut: HomeSearchTableViewControllerMock!
    
    override func setUp() {
        sut = HomeSearchTableViewControllerMock()
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

    func testCanShowErrorView() {
        // When
        sut.showErrorView(message: "message")
        // Then
        XCTAssertTrue(sut.showErrorViewCount > 0)
    }
}
