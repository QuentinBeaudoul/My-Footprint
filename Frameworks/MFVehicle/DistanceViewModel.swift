//
//  DistanceViewModel.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 17/05/2022.
//

import Foundation
import MFNetwork

class DistanceViewModel {
    private(set) var request: Request.Builder?

    let units = Constants.distanceUnits

    var value: String?
    var unit = Constants.distanceUnits.first?.key

    func load(_ request: Request.Builder) {
        self.request = request
    }

    func appendToRequest() -> Request.Builder? {
        guard let value = value,
              let unit = unit else { return nil }

        request?.addParameter(key: "distance_unit", value: unit)
        request?.addParameter(key: "distance_value", value: value)

        return request
    }
}
