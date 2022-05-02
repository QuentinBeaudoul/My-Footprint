//
//  FuelSource.swift
//  MFFuelCombustion
//
//  Created by Quentin on 29/04/2022.
//

import Foundation

struct FuelEnergySource {
    let apiName: String
    let name: String
    let units: [Unit]

    struct Unit {
        let apiUnit: String
        let name: String
    }
}
