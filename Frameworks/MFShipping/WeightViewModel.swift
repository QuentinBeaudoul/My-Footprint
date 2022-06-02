//
//  WeightViewModel.swift
//  MFShipping
//
//  Created by Quentin on 01/06/2022.
//

import Foundation
import MFNetwork

class WeightViewModel {
    private(set) var request: Request.Builder?

    let units = Constants.weightUnits

    var value: Int?
    var unit = Constants.weightUnits.first?.key

    func initRequest() -> Request.Builder? {
        guard let value = value,
              let unit = unit else { return nil }

        let request = Request.Builder()
        request.addParameter(key: "type", value: "shipping")
        request.addParameter(key: "weight_unit", value: unit)
        request.addParameter(key: "weight_value", value: value)

        return request
    }
}
