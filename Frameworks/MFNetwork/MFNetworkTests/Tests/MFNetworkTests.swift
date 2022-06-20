//
//  MFNetworkTests.swift
//  MFNetworkTests
//
//  Created by Quentin on 17/06/2022.
//

import XCTest
import Alamofire
import Mocker
import MFExtensions
@testable import MFNetwork

class MFNetworkTests: XCTestCase {

    var manager: NetworkManager?
    var configuration: URLSessionConfiguration?
    var sessionManager: Session?

    override func setUp() {
        super.setUp()
        configuration = URLSessionConfiguration.default
        configuration?.protocolClasses = [MockingURLProtocol.self]
        sessionManager = Alamofire.Session(configuration: configuration!)
        manager = NetworkManager(session: sessionManager!)
    }

    func testGivenUrlAndParams_WhenHittingEndpoint_ThenResultIsReturned() {
        // Given
        let originalURL = URL(string: "https://app.goflightlabs.com/airports")!

        // When
        let expectedData = Bundle.decode([Airport].self, from: "Airports.json", in: Bundle(for: Self.self))
        let mockedData = try! JSONEncoder().encode(expectedData)
        let mock = Mock(url: originalURL, dataType: .json, statusCode: 200, data: [.get: mockedData])
        mock.register()

        manager?.fetchData(httpType: .GET, apiKey: .airports, url: originalURL.absoluteString, parser: [Airport].self, completion: { response in
            switch response {
                // Then
            case .success(let result):
                XCTAssertEqual(expectedData, result)
            case .failure(_):
                XCTFail("error")
            }
        })

        let expectation = expectation(description: "Two arrays should be equals")
        wait(for: [expectation], timeout: 5.0)
    }

}
