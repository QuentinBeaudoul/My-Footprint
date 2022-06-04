//
//  ProcessResultTests.swift
//  MFElectricityTests
//
//  Created by Quentin Beaudoul on 04/06/2022.
//

import Foundation
import XCTest
import MFNetwork
@testable import MFElectricity

class ProcessResultTests: XCTestCase {
    var viewModel: ProcessResultViewModel?

    override func setUp() {
        super.setUp()

        viewModel = ProcessResultViewModel(networkManager: StubNetworkManager(),
                                           storeManager: StoreManager(coreDataService: StubCoreDataService()))
    }

    func testGivenTries_WhenNoMoreTry_ThenCannotTryAgain() {
        // Given
        viewModel?.retryCount = 4

        // When
        let res = viewModel?.noMoreTries

        // Then
        XCTAssertTrue(res ?? false)
    }

    func testGivenParamsLoaded_WhenPerformingRequest_ThenEstimateMustBeReturned() {
        // Given
        viewModel?.load(Request.Builder())

        // When
        viewModel?.performRequest(completion: { result in
            // Then
            switch result {
            case .success(let estimate):
                XCTAssertNotNil(estimate)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        })
    }

    func testGivenParamsNotLoaded_WhenPerformingRequest_ThenEstimateMustBeReturned() {
        // Given not loaded

        // When
        viewModel?.performRequest(completion: { result in
            // Then
            switch result {
            case .success(let estimate):
                XCTAssertNotNil(estimate)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        })
    }
}
