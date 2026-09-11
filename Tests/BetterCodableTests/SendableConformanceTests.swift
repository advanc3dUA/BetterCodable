//
//  SendableConformanceTests.swift
//  BetterCodable
//
//  Created by Yuriy Gudimov on 11.09.2026.
//

import Foundation
import XCTest
@testable import BetterCodable

final class SendableConformanceTests: XCTestCase {
    private var sut: Fixture!

    override func setUp() {
        super.setUp()
        sut = Fixture()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_builtinPropertyWrappersAreSendableForSendableValues() {
        // Arrange
        func assertSendable<T: Sendable>(_: T.Type) {}

        // Act
        assertSendable(DefaultCodable<DefaultFalseStrategy>.self)
        assertSendable(DefaultEmptyArray<Int>.self)
        assertSendable(DefaultEmptyDictionary<String, Int>.self)
        assertSendable(LossyOptional<Int>.self)
        assertSendable(DataValue<Base64Strategy<Data>>.self)
        assertSendable(DateValue<ISO8601Strategy>.self)
        assertSendable(DateValue<ISO8601WithFractionalSecondsStrategy>.self)
        assertSendable(DateValue<RFC2822Strategy>.self)
        assertSendable(DateValue<RFC3339Strategy>.self)
        assertSendable(DateValue<TimestampStrategy>.self)
        assertSendable(DateValue<YearMonthDayStrategy>.self)
        assertSendable(LossyArray<Int>.self)
        assertSendable(LossyDictionary<String, Int>.self)
        assertSendable(LosslessArray<String>.self)
        assertSendable(LosslessValue<String>.self)
        assertSendable(LosslessBoolValue<Bool>.self)

        // Assert
        XCTAssertFalse(sut.enabled)
    }
}

private struct Fixture: Codable, Sendable {
    @DefaultFalse var enabled = false
}
