//
//  ResultTests.swift
//  MFShippingTests
//
//  Created by Quentin on 02/06/2022.
//

import XCTest
@testable import MFShipping

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

    func testDistanceValueLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getDistanceValue()

        // Then
        XCTAssertEqual(res, "2000.0")
    }

    func testDistanceUnitLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getDistanceUnit()

        // Then
        XCTAssertEqual(res, "km")
    }

    func testLiteralDistanceUnitLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getLiteralDistanceUnit()

        // Then
        XCTAssertEqual(res, "Kilometers")
    }

    func testWeightUnitLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getWeightUnit()

        // Then
        XCTAssertEqual(res, "g")
    }

    func testWeightValueLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getWeightValue()

        // Then
        XCTAssertEqual(res, "200.0")
    }

    func testTransportMethodLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getTransportMethod()

        // Then
        XCTAssertEqual(res, "truck")
    }

    func testEstimatedAtLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getEstimatedAt()

        // Then
        XCTAssertEqual(res, "13:00 2020-07-31")
    }

    func testCarbonGLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonG()

        // Then
        XCTAssertEqual(res, "25.0")
    }

    func testCarbonLbLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonLb()

        // Then
        XCTAssertEqual(res, "0.06")
    }

    func testCarbonKgLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonKg()

        // Then
        XCTAssertEqual(res, "0.03")
    }

    func testCarbonMtLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonMt()

        // Then
        XCTAssertEqual(res, "0.0")
    }

    func testDistanceValueNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getDistanceValue()

        // Then
        XCTAssertEqual(res, "0.0")
    }

    func testDistanceUnitNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getDistanceUnit()

        // Then
        XCTAssertEqual(res, "")
    }

    func testLiteralDistanceUnitNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getLiteralDistanceUnit()

        // Then
        XCTAssertEqual(res, "")
    }

    func testWeightUnitNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getWeightUnit()

        // Then
        XCTAssertEqual(res, "")
    }

    func testWeightValueNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getWeightValue()

        // Then
        XCTAssertEqual(res, "0.0")
    }

    func testTransportMethodNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getTransportMethod()

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
