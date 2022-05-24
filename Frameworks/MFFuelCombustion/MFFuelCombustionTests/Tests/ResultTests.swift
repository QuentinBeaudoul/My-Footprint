//
//  ResultTests.swift
//  MFFuelCombustionTests
//
//  Created by Quentin Beaudoul on 24/05/2022.
//

import XCTest
@testable import MFFuelCombustion

class ResultTests: XCTestCase {

    var viewModel: ResultViewModel?
    var estimate: Estimate!

    override func setUp() {
        super.setUp()
        viewModel = ResultViewModel()
        estimate =  Bundle.decode(Estimate.self, from: "EstimateResponse.json", in: Bundle(for: Self.self))
    }

    func testGivenEstimate_WhenLoadingEstimate_ThenEstimateMustBeLoaded() {
        // Given in setUp

        // When
        viewModel?.loadEstimate(estimate)

        // Then
        XCTAssertNotNil(viewModel?.estimate)
    }
}
