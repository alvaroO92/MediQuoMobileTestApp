//
//  SearchDetailPresenterTests.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//

import XCTest
@testable import MediQuoMobileTestApp

class SearchDetailPresenterTests: XCTestCase {

    var sut: SearchDetailPresenterMock!

    override func setUp() {
        sut = SearchDetailPresenterMock()
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

    func testNumberOfSectionIs10() {
        XCTAssertTrue(sut.numberOfSections() == 10)
    }

    func testNumberOfRowsInSection1() {
        XCTAssertTrue(sut.numberOfRows(in: 0) == 1)
    }

    func testModelForCell0IsValid() {
        // Given
        let model = sut.modelForCell(at: 0)
        // Then
        XCTAssertTrue(model == "indexValid")
    }

    func testModelForCell11IsNotValid() {
        // Given
        let model = sut.modelForCell(at: 11)
        // Then
        XCTAssertTrue(model == "notValidIndex")
    }

    func testTitleForSection11IsNotValid() {
        // Given
        let model = sut.titleForSection(in: 11)
        // Then
        XCTAssertTrue(model == "notValidIndex")
    }

}
