//
//  FuelSourceTypeTests.swift
//  MFFuelCombustionTests
//
//  Created by Quentin Beaudoul on 24/05/2022.
//

import XCTest
@testable import MFFuelCombustion

class FuelSourceTypeTests: XCTestCase {

    var viewModel: FuelSourceTypeViewModel?

    override func setUp() {
        viewModel = FuelSourceTypeViewModel()
    }

    func testGivenArrayOfItems_WhenCountingItems_ThenTheCountMustBeGood() {

        XCTAssertEqual(viewModel?.getNumberOfItems(), Constantes.fuelSources.count)
    }

    func testGivenIndexpathOfItem_WhenSelectingOneByIndexPath_ThenTheGoodItemIsReturned() {
        // Given
        let indexPath = IndexPath(row: 0, section: 0)

        // When
        let result = viewModel?.getItem(at: indexPath)

        // Then
        let expectedResult = FuelEnergySource(apiName: "bit",
                                              name: "Bituminous Coal",
                                              units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                            name: "BTU",
                                                                            fullName: "British thermal unit"),
                                                      FuelEnergySource.Unit(apiUnit: "short_ton",
                                                                            name: "Short ton")])

        XCTAssertEqual(result, expectedResult)
    }

    func testGivenRequest_WhenBuildingRequest_ThenParametersAreAdded() {

        // Given
        viewModel?.selectedFuelSource = Constantes.fuelSources.first

        // When
        let request = viewModel?.initRequest()

        // Then
       XCTAssertNotNil(request)
    }

    func testGivenRequest_WhenCallingInitRequestBeforeSelectingItem_ThenMethodResturnNil() {
        // Given viewModel.selectedItem not set

        // When
        let res = viewModel?.initRequest()

        // Then
        XCTAssertNil(res)
    }

    func testGivenItemNotYetSelected_WhenCheckingIfItemSelected_ThenMethodReturnTrueIfNotNil() {
        // Given
        viewModel?.selectedFuelSource = Constantes.fuelSources.first

        // When
        let res = viewModel?.isFuelSourceSelected ?? false

        // Then
        XCTAssertTrue(res)
    }
}
