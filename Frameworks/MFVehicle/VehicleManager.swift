//
//  VehicleManager.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 14/05/2022.
//

import Foundation
import MFNetwork

public final class VehicleManager {

    let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }

    public static let shared = VehicleManager()

    private(set) var vehicleMakes: [VehicleMake]?

    public func getVehicleMakes(completion: ((Result<Void, Error>) -> Void)? = nil ) {
        let url = Constants.vehicleMakesUrl

        networkManager.fetchData(httpType: .GET,
                                 apiKey: .carbon,
                                 url: url,
                                 headers: nil,
                                 parameters: nil,
                                 parser: [VehicleMake].self) { result in
            switch result {
            case .success(let vehicleMakes):
                self.vehicleMakes = vehicleMakes?.sorted { $0.name.lowercased() < $1.name.lowercased() }
                completion?(.success())
            case .failure(let error):
                print(error)
            }
        }
    }
}
