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
        let fullName: String

        init(apiUnit: String, name: String) {
            self.apiUnit = apiUnit
            self.name = name
            fullName = name
        }

        init(apiUnit: String, name: String, fullName: String) {
            self.apiUnit = apiUnit
            self.name = name
            self.fullName = fullName
        }
    }
}
