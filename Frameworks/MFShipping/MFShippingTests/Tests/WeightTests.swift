//
//  WeightTests.swift
//  MFShippingTests
//
//  Created by Quentin on 02/06/2022.
//

import XCTest
import MFNetwork
@testable import MFShipping

class WeightTests: XCTestCase {
    var viewModel: WeightViewModel?

    override func setUp() {
        super.setUp()

        viewModel = WeightViewModel()
    }

    func testGivenUnitAndValueRequest_WheninitingToRequest_ThenRequestMustBeReturned() {
        // Given
        viewModel?.value = 42
        // default unit used

        // When
        let res = viewModel?.initRequest()

        // Then
        XCTAssertNotNil(res)
    }

    func testGivenUnitAndNoValueRequest_WheninitingToRequest_ThenNilMustBeReturned() {
        // Given no value
        // default unit used

        // When
        let res = viewModel?.initRequest()

        // Then
        XCTAssertNil(res)
    }
}
