//
//  AmountTests.swift
//  MFElectricityTests
//
//  Created by Quentin Beaudoul on 04/06/2022.
//

import Foundation
import XCTest
import MFNetwork
@testable import MFElectricity

class AmountTests: XCTestCase {
    var viewModel: AmountViewModel?

    override func setUp() {
        super.setUp()

        viewModel = AmountViewModel()
    }

    func testGivenUnitAndNoValue_WhenInitingToRequest_ThenNilMustBeReturned() {
        // Given
        // default unit used

        // When
        let res = viewModel?.initRequest()

        // Then
        XCTAssertNil(res)
    }

    func testGivenUnitAndValueRequestLoaded_WhenAppendingToRequest_ThenRequestMustBeBuilded() {
        // Given
        viewModel?.value = "42"
        // default unit used

        // When
        let res = viewModel?.initRequest()

        // Then
        XCTAssertNotNil(res)
    }
}
