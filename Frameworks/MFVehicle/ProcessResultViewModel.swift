//
//  ProcessResultViewModel.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 17/05/2022.
//

import Foundation

class ProcessResultViewModel {

    private(set) var vehicleModel: VehicleModel?

    func load(_ vehicleModel: VehicleModel) {
        self.vehicleModel = vehicleModel
    }
}
