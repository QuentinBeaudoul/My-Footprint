//
//  Constantes.swift
//  MFFuelCombustion
//
//  Created by Quentin on 29/04/2022.
//

import Foundation

final class Constantes {
    private init() {}

    static let fuelSources = [FuelSource(apiName: "bit", name: "Bituminous Coal"),
                              FuelSource(apiName: "dfo", name: "Home Heating and Diesel Fuel"),
                              FuelSource(apiName: "jf", name: "Jet Fuel"),
                              FuelSource(apiName: "ker", name: "Kerosene"),
                              FuelSource(apiName: "lig", name: "Lignite Coal"),
                              FuelSource(apiName: "msw", name: "Municipal Solid Waste"),
                              FuelSource(apiName: "ng", name: "Natural Gas"),
                              FuelSource(apiName: "pc", name: "Propane Gas"),
                              FuelSource(apiName: "rfo", name: "Residual Fuel Oil"),
                              FuelSource(apiName: "sub", name: "Subbituminous Coal"),
                              FuelSource(apiName: "tdf", name: "Tire-Derived Fuel"),
                              FuelSource(apiName: "wo", name: "Waste Oil")]
}
