//
//  DistanceViewModel.swift
//  MFShipping
//
//  Created by Quentin on 01/06/2022.
//

import Foundation
import MFNetwork

class DistanceViewModel {
    private(set) var request: Request.Builder?

    let units = Constants.distanceUnits

    var value: Int?
    var unit = Constants.distanceUnits.first?.key

    func load(_ request: Request.Builder) {
        self.request = request
    }

    func appendToRequest() -> Request.Builder? {
        guard let value = value,
              let unit = unit, let request = request else { return nil }

        request.addParameter(key: "distance_unit", value: unit)
        request.addParameter(key: "distance_value", value: value)

        return request
    }
}
