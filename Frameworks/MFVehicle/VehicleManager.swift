//
//  VehicleManager.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 14/05/2022.
//

import Foundation
import MFNetwork

public final class VehicleManager {
    private init() {}

    public static let shared = VehicleManager()

    private(set) var vehicleMakes: [VehicleMake]?

    public func getVehicleMakes(completion: @escaping (Result<Void, Error>) -> Void) {
        let url = Constants.vehicleMakesUrl

        NetworkManager.shared.fetchData(httpType: .GET, url: url, parser: [VehicleMake].self) { result in
            switch result {
            case .success(let vehicleMakes):
                self.vehicleMakes = vehicleMakes?.sorted { $0.name.lowercased() < $1.name.lowercased() }
                completion(.success())
            case .failure(let error):
                print(error)
            }
        }
    }
}
