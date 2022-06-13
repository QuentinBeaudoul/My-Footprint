//
//  StubNetworkManager.swift
//  MFFlightTests
//
//  Created by Quentin on 13/06/2022.
//

import Foundation
import MFNetwork
@testable import MFFlight

class StubNetworkManager: NetworkManagerProtocol {
    func fetchData<T>(httpType: HttpType,
                      apiKey: ApiKeyTypes,
                      url: String,
                      headers: [String: String]?,
                      parameters: [String: Any]?,
                      parser: T.Type,
                      completion: @escaping (Result<T?, Error>) -> Void) where T: Decodable {
        if let container = Bundle.decode(Estimate.self,
                                         from: "EstimateResponse.json",
                                         in: Bundle(for: Self.self)) as? T {
            completion(.success(container))
            return
        }

        completion(.success(nil))
    }
}
