//
//  DistanceTests.swift
//  MFShippingTests
//
//  Created by Quentin on 02/06/2022.
//

import XCTest
import MFNetwork
@testable import MFShipping

class DistanceTests: XCTestCase {
    var viewModel: DistanceViewModel?

    override func setUp() {
        super.setUp()

        viewModel = DistanceViewModel()
    }

    func testGivenUnitAndValueRequestNoLoaded_WhenAppendingToRequest_ThenNilMustBeReturned() {
        // Given
        viewModel?.value = 42
        // default unit used

        // When
        let res = viewModel?.appendToRequest()

        // Then
        XCTAssertNil(res)
    }

    func testGivenUnitAndValueRequestLoaded_WhenAppendingToRequest_ThenRequestMustBeBuilded() {
        // Given
        viewModel?.load(Request.Builder())
        viewModel?.value = 42
        // default unit used

        // When
        let res = viewModel?.appendToRequest()

        // Then
        XCTAssertNotNil(res)
    }
}
