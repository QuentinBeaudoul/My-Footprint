//
//  Constantes.swift
//  MFFuelCombustion
//
//  Created by Quentin on 29/04/2022.
//

import Foundation


enum RequestKeys: String {
    case type
    case fuelSourceType = "fuel_source_type"
    case fuelSourceValue = "fuel_source_value"
    case fuelSourceUnit = "fuel_source_unit"
}

final class Constantes {
    private init() {}


    static let fuelSources = [FuelEnergySource(apiName: "bit",
                                               name: "Bituminous Coal",
                                               units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                             name: "British thermal unit"),
                                                       FuelEnergySource.Unit(apiUnit: "short_ton",
                                                                             name: "Short ton")]),
                              FuelEnergySource(apiName: "dfo",
                                               name: "Home Heating and Diesel Fuel",
                                               units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                             name: "British thermal unit"),
                                                       FuelEnergySource.Unit(apiUnit: "gallon",
                                                                             name: "Gallon")]),
                              FuelEnergySource(apiName: "jf",
                                               name: "Jet Fuel",
                                               units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                             name: "British thermal unit"),
                                                       FuelEnergySource.Unit(apiUnit: "gallon",
                                                                             name: "Gallon")]),
                              FuelEnergySource(apiName: "ker",
                                               name: "Kerosene",
                                               units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                             name: "British thermal unit"),
                                                       FuelEnergySource.Unit(apiUnit: "gallon",
                                                                             name: "Gallon")]),
                              FuelEnergySource(apiName: "lig",
                                               name: "Lignite Coal",
                                               units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                             name: "British thermal unit"),
                                                       FuelEnergySource.Unit(apiUnit: "short_ton",
                                                                             name: "Short ton")]),
                              FuelEnergySource(apiName: "msw",
                                               name: "Municipal Solid Waste",
                                               units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                             name: "British thermal unit"),
                                                       FuelEnergySource.Unit(apiUnit: "short_ton",
                                                                             name: "Short ton")]),
                              FuelEnergySource(apiName: "ng",
                                               name: "Natural Gas",
                                               units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                             name: "British thermal unit"),
                                                       FuelEnergySource.Unit(apiUnit: "thousand_cubic_feet",
                                                                             name: "Thousand cubic feet")]),
                              FuelEnergySource(apiName: "pc",
                                               name: "Petroleum Coke",
                                               units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                             name: "British thermal unit"),
                                                       FuelEnergySource.Unit(apiUnit: "gallon",
                                                                             name: "Gallon")]),
                              FuelEnergySource(apiName: "pg",
                                               name: "Propane Gas",
                                               units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                             name: "British thermal unit"),
                                                       FuelEnergySource.Unit(apiUnit: "gallon",
                                                                             name: "Gallon")]),
                              FuelEnergySource(apiName: "rfo",
                                               name: "Residual Fuel Oil",
                                               units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                             name: "British thermal unit"),
                                                       FuelEnergySource.Unit(apiUnit: "gallon",
                                                                             name: "Gallon")]),
                              FuelEnergySource(apiName: "sub",
                                               name: "Subbituminous Coal",
                                               units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                             name: "British thermal unit"),
                                                       FuelEnergySource.Unit(apiUnit: "short_ton",
                                                                             name: "Short ton")]),
                              FuelEnergySource(apiName: "tdf",
                                               name: "Tire-Derived Fuel",
                                               units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                             name: "British thermal unit"),
                                                       FuelEnergySource.Unit(apiUnit: "short_ton",
                                                                             name: "Short ton")]),
                              FuelEnergySource(apiName: "wo",
                                               name: "Waste Oil",
                                               units: [FuelEnergySource.Unit(apiUnit: "btu",
                                                                             name: "British thermal unit"),
                                                       FuelEnergySource.Unit(apiUnit: "barrel",
                                                                             name: "Barrel")])]
}
