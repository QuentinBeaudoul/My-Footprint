//
//  TransportTests.swift
//  MFShippingTests
//
//  Created by Quentin on 02/06/2022.
//

import XCTest
import MFNetwork
@testable import MFShipping

class TransportTests: XCTestCase {

    var viewModel: TransportViewModel?

    override func setUp() {
        super.setUp()
        viewModel = TransportViewModel()
    }

    func testGivenMethods_WhenGettingNumberOfRows_ThenNumberOfRowsMustBeReturned() {
        // Given

        // When
        let res = viewModel?.numberOfItems

        // Then
        XCTAssertEqual(res, Constants.transportMethods.count)
    }

    func testGivenIndex_WhenGettingMethodFromIndex_ThenGoodMethodMustBeReturned() {
        // Given
        let index = IndexPath(row: 0, section: 0)

        // When
        let res = viewModel?.getItem(at: index)

        // Then
        XCTAssertEqual(res, "ship")
    }

    func testGivenTransportMethodNotLoaded_WhenAppendingToRequest_ThenRequestMustBeNil() {
        // Given not loaded

        // When
        let res = viewModel?.appendToRequest()

        // Then
        XCTAssertNil(res)
    }

    func testGivenTransportMethodLoaded_WhenAppendingToRequest_ThenRequestMustBeNil() {
        // Given
        viewModel?.load(Request.Builder())
        viewModel?.selectedTransportMethod = "truck"

        // When
        let res = viewModel?.appendToRequest()

        // Then
        XCTAssertNotNil(res)
    }
}
