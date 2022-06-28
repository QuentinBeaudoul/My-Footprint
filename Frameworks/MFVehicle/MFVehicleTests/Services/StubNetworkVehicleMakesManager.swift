//
//  StubNetworkManager.swift
//  MFVehicleTests
//
//  Created by Quentin Beaudoul on 24/05/2022.
//

import MFNetwork
@testable import MFVehicle

class StubNetworkVehicleMakesManager: NetworkManagerProtocol {
    func fetchData<T>(httpType: HttpType,
                      apiKey: ApiKeyTypes,
                      url: String,
                      headers: [String: String]?,
                      parameters: [String: Any]?,
                      parser: T.Type, completion: @escaping (Result<T?, Error>) -> Void) where T: Decodable {
        if let container = Bundle.decode([VehicleMake].self,
                                         from: "VehicleMakes.json",
                                         in: Bundle(for: Self.self)) as? T {
            completion(.success(container))
            return
        }

        completion(.success(nil))
    }
}
