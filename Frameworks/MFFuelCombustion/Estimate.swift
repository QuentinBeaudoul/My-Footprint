//
//  Estimate.swift
//  MFFuelCombustion
//
//  Created by Quentin on 21/04/2022.
//

import Foundation

class Estimate: Decodable {

    // parsing
    let id: String
    let fuelSourceType: String
    let fuelSourceUnit: String
    let fuelSourceValue: Double
    let estimatedAt: String
    let carbonG: Double
    let carbonLb: Double
    let carbonKg: Double
    let carbonMt: Double

    enum ContainerKeys: String, CodingKey {
        case data
    }

    enum MetadataContainer: String, CodingKey {
        case id
        case attributes
    }

    enum AttributesContainer: String, CodingKey {
        case fuelSourceType = "fuel_source_type"
        case fuelSourceUnit = "fuel_source_unit"
        case fuelSourceValue = "fuel_source_value"
        case estimatedAt = "estimated_at"
        case carbonG = "carbon_g"
        case carbonLb = "carbon_lb"
        case carbonKg = "carbon_kg"
        case carbonMt = "carbon_mt"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContainerKeys.self)
        let metadataContainer = try container.nestedContainer(keyedBy: MetadataContainer.self, forKey: .data)

        id = try metadataContainer.decode(String.self, forKey: .id)
        let attributesContainer = try metadataContainer.nestedContainer(keyedBy: AttributesContainer.self,
                                                                        forKey: .attributes)

        fuelSourceType = try attributesContainer.decode(String.self, forKey: .fuelSourceType)
        fuelSourceUnit = try attributesContainer.decode(String.self, forKey: .fuelSourceUnit)
        fuelSourceValue = try attributesContainer.decode(Double.self, forKey: .fuelSourceValue)
        estimatedAt = try attributesContainer.decode(String.self, forKey: .estimatedAt)
        carbonG = try attributesContainer.decode(Double.self, forKey: .carbonG)
        carbonLb = try attributesContainer.decode(Double.self, forKey: .carbonLb)
        carbonKg = try attributesContainer.decode(Double.self, forKey: .carbonKg)
        carbonMt = try attributesContainer.decode(Double.self, forKey: .carbonMt)
    }
}
