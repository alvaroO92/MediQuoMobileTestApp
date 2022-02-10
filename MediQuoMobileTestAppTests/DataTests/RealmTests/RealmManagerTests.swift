//
//  RealmManagerTests.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//

import XCTest
@testable import MediQuoMobileTestApp

class RealmManagerTests: XCTestCase {

    var sut: RealmManagerProtocolMock!

    override func setUp() {
    sut = RealmManagerProtocolMock()
    }

    override func tearDown() {
        sut = nil
    }

    func testReceiveData() {
        // Given
        let object: CharacterDTO! = sut.object()
        // Then
        XCTAssertNotNil(object)
    }

    func testWriteData() {
        // Given
        let object: CharacterDTO! = sut.object()
        let canWrite = sut.write(object)
        // Then
        XCTAssertTrue(canWrite)
    }

    func testUpdateData() {
        XCTAssertTrue(sut.update({}))
    }

    func testDeleteData() {
        // Given
        let object: CharacterDTO! = sut.object()
        // Then
        XCTAssertTrue(sut.delete(object))
    }
}
