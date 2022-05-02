//
//  AmountEntryViewModel.swift
//  MFFuelCombustion
//
//  Created by Quentin on 02/05/2022.
//

import Foundation
import MFNetwork

class AmountEntryViewModel {

    private(set) var request: Request.Builder?
    private(set) var fuelSource: FuelEnergySource?

    var value: String?
    var unit: String?

    var units: [FuelEnergySource.Unit]? {
        fuelSource?.units
    }
    var defaultUnit: String? {
        units?.first?.name
    }

    func load(fuelSource: FuelEnergySource, _ request: Request.Builder) {
        self.request = request
        self.fuelSource = fuelSource
    }

    func appendToRequest() -> Request.Builder? {
        guard let value = value, let unit = unit else {
            return nil
        }

        request?.addParameter(key: RequestKeys.fuelSourceValue.rawValue, value: value)
        request?.addParameter(key: RequestKeys.fuelSourceUnit.rawValue, value: unit)

        return request
    }
}
