//
//  Constants.swift
//  MFElectricity
//
//  Created by Quentin on 02/06/2022.
//

import Foundation

final class Constants {

    static let url = "https://www.carboninterface.com/api/v1/estimates"
    static let countryUrl = "https://countryflagsapi.com/png/%@"

    static let electricityUnit = ["mwh": "Megawatt",
                                  "kwh": "Kilowatt"]

    static let states = [Country(code: "CA", name: "Canada"),
                         Country(code: "AT", name: "Austia"),
                         Country(code: "BE", name: "Belgium"),
                         Country(code: "BG", name: "Bulgaria"),
                         Country(code: "HR", name: "Croatia"),
                         Country(code: "CY", name: "Cyprus"),
                         Country(code: "CZ", name: "Czechia"),
                         Country(code: "DK", name: "Denmark"),
                         Country(code: "EE", name: "Estonia"),
                         Country(code: "FI", name: "Finland"),
                         Country(code: "FR", name: "France"),
                         Country(code: "DE", name: "Germany"),
                         Country(code: "GR", name: "Greece"),
                         Country(code: "GU", name: "Hungary"),
                         Country(code: "IE", name: "Ireland"),
                         Country(code: "IT", name: "Italy"),
                         Country(code: "LV", name: "Latvia"),
                         Country(code: "LT", name: "Lithuania"),
                         Country(code: "LU", name: "Luxembourg"),
                         Country(code: "MT", name: "Malta"),
                         Country(code: "NL", name: "Netherlands"),
                         Country(code: "PL", name: "Poland"),
                         Country(code: "PT", name: "Portugal"),
                         Country(code: "RO", name: "Romania"),
                         Country(code: "SK", name: "Slovakia"),
                         Country(code: "SI", name: "Slovenia"),
                         Country(code: "ES", name: "Spain"),
                         Country(code: "SE", name: "Sweden"),
                         Country(code: "GB", name: "United Kingdom")]
}
