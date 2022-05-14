//
//  VehicleMakesViewModel.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 14/05/2022.
//

import Foundation

class VehicleMakesViewModel {

    let vehicleMakes = VehicleManager.shared.vehicleMakes
    var selectedVehicleMake: VehicleMake?

    var numberOfItems: Int {
        vehicleMakes?.count ?? 0
    }

    func getItem(at indexPath: IndexPath) -> VehicleMake? {
        vehicleMakes?[indexPath.row]
    }
}
