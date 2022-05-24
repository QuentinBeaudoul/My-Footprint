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
}
