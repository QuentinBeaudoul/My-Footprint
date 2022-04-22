//
//  Estimate.swift
//  MFShipping
//
//  Created by Quentin on 21/04/2022.
//

import Foundation

class Estimate: Decodable {
    let id: String
    let distanceValue: Int
    let weightUnit, transportMethod: String
    let weightValue: Double
    let distanceUnit: String
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
        case distanceValue = "distance_value"
        case weightUnit = "weight_unit"
        case transportMethod = "transport_method"
        case weightValue = "weight_value"
        case distanceUnit = "distance_unit"
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

        distanceValue = try attributesContainer.decode(Int.self, forKey: .distanceValue)
        distanceUnit = try attributesContainer.decode(String.self, forKey: .distanceValue)
        transportMethod = try attributesContainer.decode(String.self, forKey: .transportMethod)
        weightValue = try attributesContainer.decode(Double.self, forKey: .weightValue)
        weightUnit = try attributesContainer.decode(String.self, forKey: .weightUnit)
        estimatedAt = try attributesContainer.decode(String.self, forKey: .estimatedAt)
        carbonG = try attributesContainer.decode(Double.self, forKey: .carbonG)
        carbonLb = try attributesContainer.decode(Double.self, forKey: .carbonLb)
        carbonKg = try attributesContainer.decode(Double.self, forKey: .carbonKg)
        carbonMt = try attributesContainer.decode(Double.self, forKey: .carbonMt)
    }
}
