//
//  VehicleModelsViewModel.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 17/05/2022.
//

import Foundation
import MFNetwork

class VehicleModelsViewModel {

    private(set) var vehicleModels: [VehicleModel]?
    var selectedVehicleModel: VehicleModel?

    var numberOfItems: Int {
        vehicleModels?.count ?? 0
    }

    func load(_ vehicleModels: [VehicleModel]) {
        self.vehicleModels = vehicleModels
    }

    func getItem(at indexPath: IndexPath) -> VehicleModel? {
        vehicleModels?[indexPath.row]
    }

    func initRequest() -> Request.Builder {
        let request = Request.Builder()
        request.addParameter(key: "type", value: "vehicle")
        request.addParameter(key: "vehicle_model_id", value: selectedVehicleModel?.id ?? "")
        return request
    }
}
