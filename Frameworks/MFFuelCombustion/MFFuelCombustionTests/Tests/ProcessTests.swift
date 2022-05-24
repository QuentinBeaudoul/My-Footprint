//
//  ProcessTests.swift
//  MFFuelCombustionTests
//
//  Created by Quentin Beaudoul on 24/05/2022.
//

import XCTest
import MFNetwork
@testable import MFFuelCombustion

class ProcessTests: XCTestCase {

    var viewModel: ProcessViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ProcessViewModel(networkManager: StubNetworkManager(),
                                     storeManager: StoreManager(coreDataService: StubCoreDataService()))
    }

    func testGivenTries_WhenUseThreeTries_ThenCannotTryAnymore() {
        // Given
        viewModel.retryCount = 4

        // When
        let res = viewModel.noMoreTries

        // Then
        XCTAssertTrue(res)
    }

    func testGivenRequest_WhenPerformingRequest_ThenEstimateMustNotBeNil() {

        // Given request not loaded
        viewModel.loadRequest(request: Request.Builder())

        // When
        viewModel.performRequest { [self] result in
            switch result {

                // Then
            case .success(_):
                XCTAssertNotNil(viewModel.estimate)
            case .failure(_):
                XCTFail("failure")
            }
        }
    }

}
