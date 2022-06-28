//
//  ResultTests.swift
//  MFVehicleTests
//
//  Created by Quentin Beaudoul on 26/05/2022.
//

import Foundation
import XCTest
@testable import MFVehicle

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
        XCTAssertEqual(res, "100")
    }

    func testDistanceUnitLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getDistanceUnit()

        // Then
        XCTAssertEqual(res, "mi")
    }

    func testLiteralDistanceUnitLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getLiteralDistanceUnit()

        // Then
        XCTAssertEqual(res, "Miles")
    }

    func testVehicleMakeLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getVehicleMake()

        // Then
        XCTAssertEqual(res, "Toyota")
    }

    func testVehicleModelLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getVehicleModel()

        // Then
        XCTAssertEqual(res, "Corolla")
    }

    func testVehicleYearLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getVehicleYear()

        // Then
        XCTAssertEqual(res, "1993")
    }

    func testEstimatedAtLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getEstimatedAt()

        // Then
        XCTAssertEqual(res, "15:24 2021-01-10")
    }

    func testCarbonGLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonG()

        // Then
        XCTAssertEqual(res, "37029")
    }

    func testCarbonLbLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonLb()

        // Then
        XCTAssertEqual(res, "81.64")
    }

    func testCarbonKgLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonKg()

        // Then
        XCTAssertEqual(res, "37.03")
    }

    func testCarbonMtLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonMt()

        // Then
        XCTAssertEqual(res, "0.04")
    }

    func testDistanceValueNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getDistanceValue()

        // Then
        XCTAssertEqual(res, "")
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

    func testVehicleMakeNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getVehicleMake()

        // Then
        XCTAssertEqual(res, "")
    }

    func testVehicleModelNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getVehicleModel()

        // Then
        XCTAssertEqual(res, "")
    }

    func testVehicleYearNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getVehicleYear()

        // Then
        XCTAssertEqual(res, "0")
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
        XCTAssertEqual(res, "")
    }

    func testCarbonLbNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getCarbonLb()

        // Then
        XCTAssertEqual(res, "")
    }

    func testCarbonKgNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getCarbonKg()

        // Then
        XCTAssertEqual(res, "")
    }

    func testCarbonMtNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getCarbonMt()

        // Then
        XCTAssertEqual(res, "")
    }
}
