//
//  MFShippingTests.swift
//  MFShippingTests
//
//  Created by Quentin on 14/04/2022.
//

import XCTest
@testable import MFShipping

class ShippingTests: XCTestCase {
    var viewModel: ShippingViewModel?
    var testEstimate: Estimate?

    // MARK: Utils

    private func loadEstimate() {
        testEstimate = Bundle.decode(Estimate.self,
                                     from: "EstimateResponse.json",
                                     in: Bundle(for: Self.self))
        viewModel?.manager.addToHistory(estimate: testEstimate!)
    }

    private func loadHistory(completion: ((Result<Void, Error>) -> Void)? = nil) {
        viewModel?.reloadHistory(completion: completion)
    }

    // MARK: Tests
    override func setUp() {
        super.setUp()

        viewModel = ShippingViewModel(manager: StoreManager(coreDataService: StubCoreDataService()))
    }

    func testGivenEstimates_WhenGettingNumberOfRows_ThenNumberOfRowsMustBeReturned() {
        // Given
        loadEstimate()
        loadHistory()

        // When
        let res = viewModel?.numberOfRows

        // Then
        XCTAssertTrue(res! > 0)
    }

    func testGivenHistory_WhenCheckingIfHistoryExist_ThenTrueMustBeReturned() {
        // Given
        loadEstimate()
        loadHistory()

        // When
        let res = viewModel?.hasHistory

        // Then
        XCTAssertTrue(res!)
    }

    func testGivenIndex_WhenGettingEstimateWithIndex_ThenGoodEstimateMustBeReturned() {
        // Given
        loadEstimate()
        loadHistory()
        let index = IndexPath(row: 0, section: 0)

        // When
        let res = viewModel?.getItem(at: index)

        // Then
        XCTAssertEqual(res, viewModel?.history?.first)
    }

    func testGivenIndexToDelete_WhenRemovingEstimateWithIndex_ThenEstimateMustBeDeleted() {
        // Given
        loadEstimate()
        loadHistory()
        let indexToDelete = IndexPath(row: 0, section: 0)
        let testEstimate = viewModel?.getItem(at: indexToDelete)

        // When
        viewModel?.delete(at: indexToDelete)
        loadHistory()

        // Then
        XCTAssertFalse(viewModel?.history?.contains(testEstimate!) ?? true)
    }
}
