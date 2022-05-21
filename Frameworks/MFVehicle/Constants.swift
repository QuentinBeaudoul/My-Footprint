//
//  Constants.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 14/05/2022.
//

import Foundation

final class Constants {
    private init() {}

    private static let baseUrl = "https://www.carboninterface.com/api/v1"
    static let estimateUrl = "\(baseUrl)/estimates"
    static let vehicleMakesUrl = "\(baseUrl)/vehicle_makes"

    // %@ = vehicleMakeId
    static let VehicleModelsUrl = "\(baseUrl)/vehicle_makes/%@/vehicle_models"

    static let distanceUnits = ["km": "Kilometers", "mi": "Miles"]
}
