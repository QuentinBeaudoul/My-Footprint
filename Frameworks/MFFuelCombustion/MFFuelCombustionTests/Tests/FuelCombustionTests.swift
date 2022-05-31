//
//  FuelCombustionTests.swift
//  MFFuelCombustionTests
//
//  Created by Quentin Beaudoul on 26/05/2022.
//

import XCTest
@testable import MFFuelCombustion

class FuelComubstionTests: XCTestCase {

    var viewModel: FuelCombustionViewModel?

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
        viewModel = FuelCombustionViewModel(manager: StoreManager(coreDataService: StubCoreDataService()))
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGivenNoHistory_WhenGettingNumberOfRows_ThenZeroMustBeReturned() {
        // Given history not loaded

        // When
        let res = viewModel?.numberOfRows

        // Then
        XCTAssertEqual(res, 0)
    }

    func testGivenNoHistory_WhenCheckingIfHasHistory_ThenFalseMustBeReturned() {
        // Given

        // When
        let res = viewModel?.hasHistory

        // Then
        XCTAssertFalse(res ?? true)
    }

    func testGivenHistory_WhenReloadingHistory_ThenHistoryMustBeReloaded() {
        // Given
        loadEstimate()

        // When
        loadHistory { [self] result in
            // Then
            switch result {
            case .success():
                XCTAssertNotNil(viewModel?.history)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }

    func testGivenIndexPath_WhenGettingEstimateWithIndexPath_ThenTheGoodEstimateMustBeReturned() {
        // Given
        loadEstimate()
        loadHistory()

        // When
        let resEstimate = viewModel?.getItem(at: IndexPath(row: 0, section: 0))

        // Then
        XCTAssertEqual(testEstimate!, resEstimate!)
    }

    func testGivenHistory_WhenDeleting_ThenEstimateMustBuDeletedFromHistory() {
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
