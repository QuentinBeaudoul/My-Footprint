//
//  VehicleModelsTests.swift
//  MFVehicleTests
//
//  Created by Quentin Beaudoul on 26/05/2022.
//

import XCTest
@testable import MFVehicle

class VehicleModelsTests: XCTestCase {

    let viewModel = VehicleModelsViewModel()
    var vehicleModels: [VehicleModel]?

    override func setUp() {
        super.setUp()

        vehicleModels = Bundle.decode([VehicleModel].self,
                                      from: "VehicleModels.json",
                                      in: Bundle(for: Self.self))
    }

    func testGivenNoVehicleModels_WhenGettingNumberOfItems_ThenZeroMustBeReturned() {
        // Given nothing

        // When
        let res = viewModel.numberOfItems

        // Then
        XCTAssertEqual(res, 0)
    }

    func testGivenIndex_WhenGettingVehicleModelWithIndex_ThenVehicleModelMustBeReturned() {
        // Given
        viewModel.load(vehicleModels!)
        let index = IndexPath(row: 0, section: 0)

        // When
        let res = viewModel.getItem(at: index)

        // Then
        XCTAssertEqual(res, vehicleModels?.first)
    }

    func testGivenNothing_WheninitRequest_ThenRequestMustBeReturned() {
        // Given

        // When
        let res = viewModel.initRequest()

        // Then
        XCTAssertNotNil(res)
    }
}
