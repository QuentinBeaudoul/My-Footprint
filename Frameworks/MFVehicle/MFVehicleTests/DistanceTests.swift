//
//  DistanceTests.swift
//  MFVehicleTests
//
//  Created by Quentin Beaudoul on 26/05/2022.
//

import Foundation
import MFNetwork
import XCTest
@testable import MFVehicle

class DistanceTests: XCTestCase {

    var viewModel: DistanceViewModel?

    override func setUp() {
        super.setUp()

        viewModel = DistanceViewModel()
    }

    func testGivenUnitAndValueRequestNoLoaded_WhenAppendingToRequest_ThenNilMustBeReturned() {
        // Given
        viewModel?.value = "42"
        // default unit used

        // When
        let res = viewModel?.appendToRequest()

        // Then
        XCTAssertNil(res)
    }

    func testGivenUnitAndValueRequestLoaded_WhenAppendingToRequest_ThenRequestMustBeBuilded() {
        // Given
        viewModel?.load(Request.Builder())
        viewModel?.value = "42"
        // default unit used

        // When
        let res = viewModel?.appendToRequest()

        // Then
        XCTAssertNotNil(res)
    }
}
