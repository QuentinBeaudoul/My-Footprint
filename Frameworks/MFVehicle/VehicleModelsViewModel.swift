//
//  VehicleModelsViewModel.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 17/05/2022.
//

import Foundation

class VehicleModelsViewModel {

    private(set) var vehicleModels: [VehicleModel]?

    func load(_ vehicleModels: [VehicleModel]) {
        self.vehicleModels = vehicleModels
    }
}
