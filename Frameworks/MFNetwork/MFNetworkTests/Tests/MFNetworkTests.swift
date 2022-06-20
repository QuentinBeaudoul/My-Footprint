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
        let params = ["access_key": ApiKeyTypes.airports.rawValue]

        // When
        let expectedData = Bundle.decode([Airport].self, from: "Airports.json", in: Bundle(for: Self.self))
        let mockedData = try! JSONEncoder().encode(expectedData)
        let mockedUrl = URL(string: "https://app.goflightlabs.com/airports?access_key=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI0IiwianRpIjoiNTkwNDE2ODU4NjI4ZWY5Zjg4ZDQ3YmUxODgxNmI4NjJkMzFkNTQ1MGRjNDNkM2IyMzFlOTI2ZDk5YTMxMWNmYzE0NTJhYWYyM2RlMjcwNjgiLCJpYXQiOjE2NTQ4NTI2MTgsIm5iZiI6MTY1NDg1MjYxOCwiZXhwIjoxNjg2Mzg4NjE4LCJzdWIiOiI1OTk0Iiwic2NvcGVzIjpbXX0.ZT8wIdggtsSPq09tb7Ii3mTsAxky1GKbCV6gfmBfGiFtJo183XDX8jBjijj2ZZYXEkKXXzOI75vouY-Iu_XiDA")!
        let mock = Mock(url: mockedUrl, dataType: .json, statusCode: 200, data: [.get: mockedData])
        mock.register()

        manager?.fetchData(httpType: .GET, apiKey: .airports, url: originalURL.absoluteString, parameters: params, parser: [Airport].self, completion: { response in
            switch response {
                // Then
            case .success(let result):
                XCTAssertEqual(expectedData, result)
            case .failure(_):
                XCTFail("error")
            }
        })

        let expectation = expectation(description: "Two arrays should be equals")
        wait(for: [expectation], timeout: 10.0)
    }

}
