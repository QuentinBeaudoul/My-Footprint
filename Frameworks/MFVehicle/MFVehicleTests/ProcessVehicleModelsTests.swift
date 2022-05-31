//
//  ProcessVehicleModelsTests.swift
//  MFVehicleTests
//
//  Created by Quentin Beaudoul on 26/05/2022.
//

import Foundation
import XCTest
@testable import MFVehicle

class ProcessVehicleModelsTests: XCTestCase {

    var viewModel: ProcessVehicleModelsViewModel?
    var vehicleMake: VehicleMake?

    override func setUp() {
        super.setUp()
        viewModel = ProcessVehicleModelsViewModel(networkManager: StubNetworkVehicleModelsManager())

        vehicleMake = Bundle.decode([VehicleMake].self,
                                    from: "VehicleMakes.json",
                                    in: Bundle(for: Self.self)).first
    }

    func testGivenTries_WhenNoMoreTry_ThenCannotTryAgain() {
        // Given
        viewModel?.retryCount = 4

        // When
        let res = viewModel?.noMoreTries

        // Then
        XCTAssertTrue(res ?? false)
    }

    func testGivenNoVehicleMake_WhenPerformingRequest_ThenNothingMustBeReturned() {
        // Given nothing

        // When
        viewModel?.performRequest(completion: { result in
            // Then
            switch result {
            case .success(let vehicleModels):
                XCTAssertNil(vehicleModels)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        })
    }

    func testGivenVehicleMake_WhenPerformingRequest_ThenVehicleModelsMustBeFetched() {
        // Given in setup
        viewModel?.load(vehicleMake!)
        // When
        viewModel?.performRequest(completion: { result in
            // Then
            switch result {
            case .success(let vehicleModels):
                XCTAssertNotNil(vehicleModels)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        })
    }
}
