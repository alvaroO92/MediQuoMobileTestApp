//
//  SearchDetailQuotesUseCaseTests.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import XCTest
@testable import MediQuoMobileTestApp

class SearchDetailQuotesUseCaseTests: XCTestCase {
    
    var sut: SearchDetailQuotesUseCaseProtocol!

    override func setUp() {
        sut = makeSut()
    }

    override func tearDown() {
        sut = nil
    }

    func testSutIsNotNil() {
        XCTAssertNotNil(sut)
    }

    func testQuotesResponseSuccess() {
        // Given
        let expectation = XCTestExpectation(description: #function)
        // When
        sut.quotes { _ in
            expectation.fulfill()
        }
        // Then
        wait(for: [expectation], timeout: 1.0)
    }

    private func makeSut() -> SearchDetailQuotesUseCaseProtocol {
        let repository = SearchDetailQuotesRepositoryMock()
        sut = SearchDetailQuotesUseCase(repository: repository)
        return sut
    }
}
