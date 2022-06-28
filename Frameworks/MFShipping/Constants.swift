//
//  Constants.swift
//  MFShipping
//
//  Created by Quentin on 02/06/2022.
//

import Foundation

final class Constants {
    private init() {}

    static let url = "https://www.carboninterface.com/api/v1/estimates"
    static let distanceUnits = ["km": "Kilometers", "mi": "Miles"]
    static let weightUnits = ["g": "Grams", "lb": "Pounds", "kg": "Kilograms", "mt": "Tonnes"]
    static let transportMethods = ["ship", "train", "truck", "plane"]
}
