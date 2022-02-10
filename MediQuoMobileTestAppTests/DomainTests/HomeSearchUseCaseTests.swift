//
//  HomeSearchUseCaseTests.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import XCTest
@testable import MediQuoMobileTestApp

class HomeSearchUseCaseTests: XCTestCase {

    var sut: HomeSearchUseCaseProtocol!

    override func setUp() {
        sut = makeSut()
    }

    override func tearDown() {
        sut = nil
    }

    func testSutIsNotNil() {
        XCTAssertNotNil(sut)
    }

    func testBetterCallSaulResponseSuccess() {
        // Given
        let expectation = XCTestExpectation(description: #function)
        // When
        sut.getCharacters(category: .BetterCallSaul) { _ in
            expectation.fulfill()
        }
        // Then
        wait(for: [expectation], timeout: 1.0)
    }

    private func makeSut() -> HomeSearchUseCaseProtocol {
        let repository = HomeSearchRepositoryMock()
        sut = HomeSearchUseCase(repository: repository)
        return sut
    }
}
