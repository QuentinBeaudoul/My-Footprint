//
//  ResultTests.swift
//  MFFlightTests
//
//  Created by Quentin on 13/06/2022.
//

import XCTest
@testable import MFFlight

class ResultTests: XCTestCase {

    var viewModel: ResultViewModel?
    var estimate: Estimate?

    override func setUp() {
        super.setUp()

        viewModel = ResultViewModel(manager: AirportManager(networkManager: StubAirportsNetworkManager()))
        viewModel?.manager.fetchAirports(completion: { _ in })
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
        XCTAssertEqual(res, "7454.15")
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

    func testDepartureAirportLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getDepartureAirport()
        let expectedResult = Bundle.decode([Airport].self,
                                           from: "Airports.json",
                                           in: Bundle(for: Self.self)).first

        // Then
        XCTAssertEqual(res, expectedResult)
    }

    func testDestinationAirportLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getDestinationAirport()
        let expectedResult = Bundle.decode([Airport].self,
                                           from: "Airports.json",
                                           in: Bundle(for: Self.self))[1]

        // Then
        XCTAssertEqual(res, expectedResult)
    }

    func testEstimatedAtLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getEstimatedAt()

        // Then
        XCTAssertEqual(res, "02:25 2020-07-24")
    }

    func testCarbonGLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonG()

        // Then
        XCTAssertEqual(res, "1077098.0")
    }

    func testCarbonLbLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonLb()

        // Then
        XCTAssertEqual(res, "2374.0")
    }

    func testCarbonKgLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonKg()

        // Then
        XCTAssertEqual(res, "1077.0")
    }

    func testCarbonMtLoaded() {
        // Given
        viewModel?.load(estimate!)

        // When
        let res = viewModel?.getCarbonMt()

        // Then
        XCTAssertEqual(res, "1.0")
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

    func testDepartureAirportNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getDepartureAirport()

        // Then
        XCTAssertNil(res)
    }

    func testDestinationAirportNotLoaded() {
        // Given not loaded

        // When
        let res = viewModel?.getDestinationAirport()

        // Then
        XCTAssertNil(res)
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
