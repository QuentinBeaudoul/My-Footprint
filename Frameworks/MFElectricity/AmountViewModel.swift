//
//  AmountViewModel.swift
//  MFElectricity
//
//  Created by Quentin on 03/06/2022.
//

import Foundation
import MFNetwork

class AmountViewModel {

    let units = Constants.electricityUnit

    var value: String?
    var unit = Constants.electricityUnit.first?.key

    func initRequest() -> Request.Builder? {
        guard let value = value,
              let unit = unit else { return nil }

        let request = Request.Builder()
        request.addParameter(key: "type", value: "electricity")
        request.addParameter(key: "electricity_unit", value: unit)
        request.addParameter(key: "electricity_value", value: value)

        return request
    }
}
