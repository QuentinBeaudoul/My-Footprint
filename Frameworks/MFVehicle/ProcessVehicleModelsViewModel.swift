//
//  ProcessVehicleModelsViewModel.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 17/05/2022.
//

import Foundation
import MFNetwork

class ProcessVehicleModelsViewModel {

    private(set) var vehicleMake: VehicleMake?
    private(set) var vehicleModels: [VehicleModel]?

    var retryCount = 0
    var noMoreTries: Bool {
        retryCount >= 3
    }

    func load(_ vehicleMake: VehicleMake) {
        self.vehicleMake = vehicleMake
    }

    func performRequest(completion: @escaping (Result<[VehicleModel]?, Error>) -> Void) {
        guard let vehicleMake = vehicleMake else {
            return
        }

        let url = String(format: Constants.VehicleModelsUrl, vehicleMake.id)

        NetworkManager.shared.fetchData(httpType: .GET, url: url, parser: [VehicleModel].self) { response in
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
