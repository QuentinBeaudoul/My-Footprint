//
//  MFNetworkTests.swift
//  MFNetworkTests
//
//  Created by Quentin on 17/06/2022.
//

import XCTest
import Alamofire
import Mocker

class MFNetworkTests: XCTestCase {

    func testGivenUrlAndParams_WhenHittingEndpoint_ThenResultIsReturned() {
        // Given
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)
        // When

        // Then
    }

}
