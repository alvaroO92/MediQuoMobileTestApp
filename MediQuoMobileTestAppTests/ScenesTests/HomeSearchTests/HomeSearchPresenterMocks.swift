//
//  HomeSearchPresenterMocks.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import XCTest
@testable import MediQuoMobileTestApp

class HomeSearchPresenterMocks: XCTestCase {

    var sut: HomeSearchPresenterMock!

    override func setUp() {
        sut = HomeSearchPresenterMock()
    }

    override func tearDown() {
        sut = nil
    }

    func testSutIsNotNil() {
        XCTAssertNotNil(sut)
    }

    func testViewWillAppearLoad() {
        // When
        sut.viewWillAppear()
        // Then
       XCTAssertTrue(sut.viewWillAppearCount > 0)
    }

    func testViewDidLoad() {
        // When
        sut.viewDidLoad()
        // Then
       XCTAssertTrue(sut.viewDidLoadCount > 0)
    }

    func testChangeSegmentedTab() {
        // When
        sut.changeSegmentedTab(for: 1)
        // Then
       XCTAssertTrue(sut.changeSegmentedCount > 0)
    }

    func testHeightForRowIs100() {
       XCTAssertTrue(sut.heightForRow() == 100)
    }

    func testNumberOfSection() {
        XCTAssertTrue(sut.numberOfSections() == 1)
    }

    func testNumberOfRowsInSection0() {
        XCTAssertTrue(sut.numberOfRows(in: 0) == 50)
    }

    func testModelOfCellWithCorrectIndex() {
        // Given
        let cell = sut.modelForCell(at: 0)
        // Then
        XCTAssertNotNil(cell)
    }

    func testModelOfCellWithOutOfRange() {
        // Given
        let expectation = XCTestExpectation(description: #function)
        let cell = sut.modelForCell(at: 1000)
        
        // Then
        if case .noResult = cell {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 4.0)
    }

    func testCanFiltering() {
        // When
        sut.filter(by: "example")
        
        // Then
        XCTAssertTrue(sut.isFiltering)
    }

    func testCanGoToDetail() {
        // When
        sut.goToDetail(for: 0)
        // Then
        XCTAssertTrue(sut.goToDetailEnabled)
    }
}
