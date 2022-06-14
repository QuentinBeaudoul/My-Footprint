//
//  ProcessVehicleModelsViewModel.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 17/05/2022.
//

import Foundation
import MFNetwork

class ProcessVehicleModelsViewModel {

    let networkManager: NetworkManagerProtocol

    private(set) var vehicleMake: VehicleMake?
    private(set) var vehicleModels: [VehicleModel]?

    var retryCount = 0
    var noMoreTries: Bool {
        retryCount >= 3
    }

    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }

    func load(_ vehicleMake: VehicleMake) {
        self.vehicleMake = vehicleMake
    }

    func performRequest(completion: @escaping (Result<[VehicleModel]?, Error>) -> Void) {
        guard let vehicleMake = vehicleMake else {
            return completion(.success(nil))
        }

        let url = String(format: Constants.VehicleModelsUrl, vehicleMake.id)

        networkManager.fetchData(httpType: .GET,
                                 apiKey: .carbon,
                                 url: url,
                                 headers: nil,
                                 parameters: nil,
                                 parser: [VehicleModel].self) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let vehicleModels):
                self.vehicleModels = vehicleModels
                completion(.success(vehicleModels))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
