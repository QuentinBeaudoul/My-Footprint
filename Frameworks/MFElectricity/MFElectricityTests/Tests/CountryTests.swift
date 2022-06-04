//
//  CountryTests.swift
//  MFElectricityTests
//
//  Created by Quentin Beaudoul on 04/06/2022.
//

import Foundation
import XCTest
import MFNetwork
@testable import MFElectricity

class CountryTests: XCTestCase {
    var viewModel: CountryViewModel?

    override func setUp() {
        super.setUp()
        viewModel = CountryViewModel()
    }

    func testGivenStates_WhenGettingNumberOfRows_ThenNumberOfRowsMustBeReturned() {
        // Given

        // When
        let res = viewModel?.numberOfItems

        // Then
        XCTAssertEqual(res, Constants.states.count)
    }

    func testGivenIndex_WhenGettingMethodFromIndex_ThenGoodMethodMustBeReturned() {
        // Given
        let index = IndexPath(row: 0, section: 0)

        // When
        let res = viewModel?.getItem(at: index)

        // Then
        XCTAssertEqual(res, Constants.states.first!)
    }

    func testGivenCountriesNotLoaded_WhenAppendingToRequest_ThenRequestMustBeNil() {
        // Given not loaded

        // When
        let res = viewModel?.appendToRequest()

        // Then
        XCTAssertNil(res)
    }

    func testGivenSelectedCountryLoaded_WhenAppendingToRequest_ThenRequestMustBeNil() {
        // Given
        viewModel?.load(Request.Builder())
        viewModel?.selectedCountry = Constants.states.first

        // When
        let res = viewModel?.appendToRequest()

        // Then
        XCTAssertNotNil(res)
    }
}
