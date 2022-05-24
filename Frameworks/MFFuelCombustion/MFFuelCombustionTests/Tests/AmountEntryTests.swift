//
//  AmountEntryTests.swift
//  MFFuelCombustionTests
//
//  Created by Quentin Beaudoul on 24/05/2022.
//

import XCTest
import MFNetwork
@testable import MFFuelCombustion

class AmountEntryTests: XCTestCase {

    var viewModel: AmountEntryViewModel?
    let fuelSourceEnergy = FuelEnergySource(apiName: "bit",
                                            name: "Bituminous Coal",
                                            units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                          name: "BTU",
                                                                         fullName: "British thermal unit"),
                                                    FuelEnergySource.Unit(apiUnit: "short_ton",
                                                                          name: "Short ton")])

    override func setUp() {
        super.setUp()
        viewModel = AmountEntryViewModel()
    }

    func testGivenNilFuelSource_WhenGettingUnits_ThenResultIsNil() {
        // Given no fuelSource

        // When
        let res = viewModel?.units

        // Then
        XCTAssertNil(res)
    }

    func testGivenfuelSource_WhenGettingDefaultUnit_ThenMustReturnTheIFirstValue() {
        // Given
        let fuelEnergySource = Constantes.fuelSources.first!
        let request = Request.Builder()
        viewModel?.load(fuelSource: fuelEnergySource, request)

        // When
        let res = viewModel?.defaultUnit

        // Then
        XCTAssertEqual(res, Constantes.fuelSources.first?.units.first)
    }

    func testGivenFuelSource_WhenChenckingIfUnitNameAndFullNameAreSame_ThenResult() {
        // Given
        viewModel?.unit = FuelEnergySource.Unit(apiUnit: "id", name: "A name", fullName: "A name")

        // When
        let res = viewModel!.isUnitNameAndFullNameSame

        // Then
        XCTAssertTrue(res)
    }

    func testGivenRequestWithSetupValueAndUnit_WhenBuildingRequest_ThenParametersMustBeAppended() {
        // Given
        viewModel?.unit = FuelEnergySource.Unit(apiUnit: "brf", name: "Broforce")
        viewModel?.value = "560"
        viewModel?.load(fuelSource: Constantes.fuelSources.first!, Request.Builder())

        // When
        let res = viewModel?.appendToRequest()

        // Then
        XCTAssertNotNil(res)
    }

    func testGivenRequestWithNoValueAndNoUnit_WhenBuildingRequest_ThenResquetMustBeNil() {
        // Given no values

        // When
        let res = viewModel?.appendToRequest()

        // Then
        XCTAssertNil(res)
    }
}
