//
//  VehicleMakesTests.swift
//  MFVehicleTests
//
//  Created by Quentin Beaudoul on 26/05/2022.
//

import Foundation
import XCTest
@testable import MFVehicle

class VehicleMakesTests: XCTestCase {

    var viewModel: VehicleMakesViewModel?

    override func setUp() {
        super.setUp()
        viewModel = VehicleMakesViewModel(manager: VehicleManager(networkManager: StubNetworkVehicleMakesManager()))

        viewModel?.manager.getVehicleMakes()
    }

    func testGivenVehicleMakesList_WhenGettingNumberOfRows_ThenNumberOfRowsMustBeReturned() {
        // Given in setup

        // When
        let res = viewModel?.numberOfItems

        // Then
        XCTAssertEqual(res, viewModel?.manager.vehicleMakes?.count)

    }

    func testGivenIndex_ThenGettingVehicleMakeWithIndex_ThenTheGoodVehicleMakeMustBeReturned() {
        // Given
        let indexpath = IndexPath(row: 1, section: 0)

        // When
        let res = viewModel?.getItem(at: indexpath)

        // Then
        XCTAssertEqual(res, viewModel?.manager.vehicleMakes?[1])

    }
}
