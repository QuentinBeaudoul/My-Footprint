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
    var estimateNoMatch: Estimate!
    var estimateNoFullName: Estimate!

    override func setUp() {
        super.setUp()
        viewModel = ResultViewModel()
        estimate =  Bundle.decode(Estimate.self,
                                  from: "EstimateResponse.json",
                                  in: Bundle(for: Self.self))
        estimateNoMatch = Bundle.decode(Estimate.self,
                                        from: "EstimateResponseNoMatche.json",
                                        in: Bundle(for: Self.self))
        estimateNoFullName = Bundle.decode(Estimate.self,
                                           from: "EstimateResponseNoFullName.json",
                                           in: Bundle(for: Self.self))
    }

    func testGivenEstimate_WhenLoadingEstimate_ThenEstimateMustBeLoaded() {
        // Given in setUp

        // When
        viewModel?.loadEstimate(estimate)

        // Then
        XCTAssertNotNil(viewModel?.estimate)
    }

    func testGivenEstimate_WhenGettingName_ThenNameIsReturned() {
        // Given in setUp

        // When
        viewModel?.loadEstimate(estimate)
        let res = viewModel?.getName()

        // Then
        XCTAssertEqual(res, "Home Heating and Diesel Fuel")
    }

    func testGivenEstimateNotLoaded_WhenGettingName_ThenEmptyStringReturned() {
        // Given in setUp

        // When
        let res = viewModel?.getName()

        // Then
        XCTAssertEqual(res, "")
    }

    func testGivenUnit_WhenGettingFullName_ThenUnitFullNameIsReturned() {
        // Given in setUp

        // When
        viewModel?.loadEstimate(estimate)
        let res = viewModel?.getUnitFullName()

        // Then
        XCTAssertEqual(res, "British thermal unit")
    }

    func testGivenUnitWithoutFullname_WhenGettingFullName_ThenUnitShortNameIsReturned() {
        // Given in setUp

        // When
        viewModel?.loadEstimate(estimateNoFullName)
        let res = viewModel?.getUnitFullName()

        // Then
        XCTAssertEqual(res, "Gallon")
    }

    func testGivenUnitNoMatche_WhenGettingFullName_ThenEmptyStringIsReturned() {
        // Given in setUp

        // When
        viewModel?.loadEstimate(estimateNoMatch)
        let res = viewModel?.getUnitFullName()

        // Then
        XCTAssertEqual(res, "")
    }

    func testGivenEstimate_WhenGettingEstimatedAt_ThenFormattedEstimatedIsReturned() {
        // Given in setup

        // When
        viewModel?.loadEstimate(estimate)
        let res = viewModel?.getEstimatedAt()

        // Then
        XCTAssertEqual(res, "02:23 2020-07-24") // 2020-07-24T02:23:24.441Z
    }

    func testGivenEstimate_WhenGettingSourceValue_ThenSourceValueStringIsReturned() {
        // Given in setup

        // When
        viewModel?.loadEstimate(estimate)
        let res = viewModel?.getSourceValue()

        // Then
        XCTAssertEqual(res, "2")
    }

    func testGivenEstimate_WhenGettingCarbonLb_ThenCarbonLbStringIsReturned() {
        // Given in setup

        // When
        viewModel?.loadEstimate(estimate)
        let res = viewModel?.getCarbonLb()

        // Then
        XCTAssertEqual(res, "322.58")
    }

    func testGivenEstimate_WhenGettingCarbonKg_ThenCarbonKgStringIsReturned() {
        // Given in setup

        // When
        viewModel?.loadEstimate(estimate)
        let res = viewModel?.getCarbonKg()

        // Then
        XCTAssertEqual(res, "146.32")
    }

    func testGivenEstimate_WhenGettingCarbonMt_ThenCarbonMtStringIsReturned() {
        // Given in setup

        // When
        viewModel?.loadEstimate(estimate)
        let res = viewModel?.getCarbonMt()

        // Then
        XCTAssertEqual(res, "0.15")
    }

    func testGivenEstimate_WhenGettingCarbonG_ThenCarbonGStringIsReturned() {
        // Given in setup

        // When
        viewModel?.loadEstimate(estimate)
        let res = viewModel?.getCarbonG()

        // Then
        XCTAssertEqual(res, "146320")
    }
}
