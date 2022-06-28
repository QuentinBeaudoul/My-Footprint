//
//  SelectAirportTests.swift
//  MFFlightTests
//
//  Created by Quentin on 13/06/2022.
//

import Foundation
import XCTest
@testable import MFFlight

class SelectAirportTests: XCTestCase {

    var viewModel: SelectAirportViewModel?

    override func setUp() {
        super.setUp()
        let airportManager = AirportManager(networkManager: StubAirportsNetworkManager())
        airportManager.fetchAirports { _ in }
        viewModel = SelectAirportViewModel(manager: airportManager)
    }

    func testGivenListOfAirport_WhenGettingNumberOfItems_ThenGoodNumberOfItemsMustBeReturned() {
        // Given
        // When
        let res = viewModel?.numberOfItems

        // Then
        XCTAssertEqual(res, 100)
    }

    func testGivenAirportIndexPath_WhenGettingAirportWithIndexPath_ThenTheGoodAirportMustBeReturned() {
        // Given
        let indexPath = IndexPath(row: 0, section: 0)

        // When
        let res = viewModel?.getItem(at: indexPath)
        let expectedResult = Bundle.decode([Airport].self, from: "Airports.json", in: Bundle(for: Self.self)).first

        // Then
        XCTAssertEqual(res, expectedResult)
    }

    func testGivenAirport_WhenGettingIndexPathWithAirport_ThenTheGoodIndexPathMustBeReturned() {
        // Given
        let airport = Bundle.decode([Airport].self, from: "Airports.json", in: Bundle(for: Self.self))[5]

        // When
        let res = viewModel?.getIndexPath(for: airport)
        let expectedRes = IndexPath(row: 5, section: 0)

        // Then
        XCTAssertEqual(res, expectedRes)
    }

    func testGivenAirport_WhenSettingDestinationAirportWithAirport_ThenDestinationAirportMustBeEqualToAirport() {
        // Given
        let airport = Bundle.decode([Airport].self, from: "Airports.json", in: Bundle(for: Self.self)).first

        // When
        viewModel?.setDestination(airport!)

        // Then
        XCTAssertEqual(viewModel?.destination, airport)
    }

    func testGivenAirport_WhenSettingDepartureAirportWithAirport_ThenDepartureAirportMustBeEqualToAirport() {
        // Given
        let airport = Bundle.decode([Airport].self, from: "Airports.json", in: Bundle(for: Self.self)).first

        // When
        viewModel?.setDeparture(airport!)

        // Then
        XCTAssertEqual(viewModel?.departure, airport)
    }

    func testGivenNoDestinationAndNoDeparture_WhenInitingRequest_ThenRequestMustBeNil() {
        // Given no destination and not departure

        // When
        let res = viewModel?.initRequest()

        // Then
        XCTAssertNil(res)
    }

    func testGivenDestinationAndDeparture_WhenInitingRequest_ThenRequestMustNotBeNil() {
        // Given
        let departure = Bundle.decode([Airport].self, from: "Airports.json", in: Bundle(for: Self.self)).first
        let destination = Bundle.decode([Airport].self, from: "Airports.json", in: Bundle(for: Self.self)).last
        viewModel?.setDeparture(departure!)
        viewModel?.setDestination(destination!)

        // When
        let res = viewModel?.initRequest()

        // Then
        XCTAssertNotNil(res)
    }
}
