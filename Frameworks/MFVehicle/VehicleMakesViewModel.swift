//
//  VehicleMakesViewModel.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 14/05/2022.
//

import Foundation

class VehicleMakesViewModel {

    let manager: VehicleManager
    var selectedVehicleMake: VehicleMake?

    init(manager: VehicleManager = VehicleManager.shared) {
        self.manager = manager
    }

    func getVehicleMakes() -> [VehicleMake]? {
        manager.vehicleMakes
    }

    var numberOfItems: Int {
        getVehicleMakes()?.count ?? 0
    }

    func getItem(at indexPath: IndexPath) -> VehicleMake? {
        getVehicleMakes()?[indexPath.row]
    }
}
