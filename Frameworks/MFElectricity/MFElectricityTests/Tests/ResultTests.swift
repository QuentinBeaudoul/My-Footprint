//
//  ResultTests.swift
//  MFElectricityTests
//
//  Created by Quentin Beaudoul on 04/06/2022.
//

import Foundation
import XCTest
@testable import MFElectricity

class ResultTests: XCTestCase {
    var viewModel: ResultViewModel?
    var estimate: Estimate?

    override func setUp() {
        super.setUp()

        viewModel = ResultViewModel()
        estimate = Bundle.decode(Estimate.self,
                                 from: "EstimateResponse.json",
                                 in: Bundle(for: Self.self))
    }

    func testElectricityUnitLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getElectricityUnit()

        // Then
        XCTAssertEqual(res, "mwh")
    }

    func testElectricityValueLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getElectricityValue()

        // Then
        XCTAssertEqual(res, "42.0")
    }

    func testCountryCodeUnitLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCountryCode()

        // Then
        XCTAssertEqual(res, "fr")
    }

    func testLiteralCountryLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getLiteralCountry()

        // Then
        XCTAssertEqual(res, "France")
    }

    func testEstimatedAtLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getEstimatedAt()

        // Then
        XCTAssertEqual(res, "02:23 2020-07-24")
    }

    func testCarbonGLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonG()

        // Then
        XCTAssertEqual(res, "18051428.0")
    }

    func testCarbonLbLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonLb()

        // Then
        XCTAssertEqual(res, "39796.0")
    }

    func testCarbonKgLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonKg()

        // Then
        XCTAssertEqual(res, "18051.0")
    }

    func testCarbonMtLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonMt()

        // Then
        XCTAssertEqual(res, "18.0")
    }

    func testElectricityUnitNotLoaded() {
        // Given

        // When
        let res = viewModel?.getElectricityUnit()

        // Then
        XCTAssertEqual(res, "")
    }

    func testElectricityValueNotLoaded() {
        // Given

        // When
        let res = viewModel?.getElectricityValue()

        // Then
        XCTAssertEqual(res, "0.0")
    }

    func testCountryCodeUnitNotLoaded() {
        // Given

        // When
        let res = viewModel?.getCountryCode()

        // Then
        XCTAssertEqual(res, "")
    }

    func testLiteralCountryNotLoaded() {
        // Given

        // When
        let res = viewModel?.getLiteralCountry()

        // Then
        XCTAssertEqual(res, "")
    }

    func testEstimatedAtNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getEstimatedAt()

        // Then
        XCTAssertEqual(res, "")
    }

    func testCarbonGNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getCarbonG()

        // Then
        XCTAssertEqual(res, "0.0")
    }

    func testCarbonLbNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getCarbonLb()

        // Then
        XCTAssertEqual(res, "0.0")
    }

    func testCarbonKgNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getCarbonKg()

        // Then
        XCTAssertEqual(res, "0.0")
    }

    func testCarbonMtNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getCarbonMt()

        // Then
        XCTAssertEqual(res, "0.0")
    }
}
