//
//  Estimate.swift
//  MFFlight
//
//  Created by Quentin on 22/04/2022.
//

import Foundation

class Estimate: Decodable {
    let id: String
    let passengers: Int
    let legs: [Legs]
    let distanceValue: Double
    let distanceUnit, estimatedAt: String
    let carbonG, carbonLb, carbonKg, carbonMt: Double

    enum ContainerCodingKeys: String, CodingKey {
        case data
    }

    enum MetadataCodingKeys: String, CodingKey {
        case id
        case attributes
    }

    enum AttributesCodingKeys: String, CodingKey {
        case passengers
        case legs
        case distanceValue = "distance_value"
        case distanceUnit = "distance_unit"
        case estimatedAt = "estimated_at"
        case carbonG = "carbon_g"
        case carbonLb = "carbon_lb"
        case carbonKg = "carbon_kg"
        case carbonMt = "carbon_mt"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContainerCodingKeys.self)
        let metadataContainer = try container.nestedContainer(keyedBy: MetadataCodingKeys.self,
                                                              forKey: .data)

        id = try metadataContainer.decode(String.self, forKey: .id)

        let attributesContainer = try metadataContainer.nestedContainer(keyedBy: AttributesCodingKeys.self,
                                                                        forKey: .attributes)

        passengers = try attributesContainer.decode(Int.self, forKey: .passengers)
        legs = try attributesContainer.decode([Legs].self, forKey: .legs)
        distanceValue = try attributesContainer.decode(Double.self, forKey: .distanceValue)
        distanceUnit = try attributesContainer.decode(String.self, forKey: .distanceUnit)
        estimatedAt = try attributesContainer.decode(String.self, forKey: .estimatedAt)
        carbonG = try attributesContainer.decode(Double.self, forKey: .carbonG)
        carbonLb = try attributesContainer.decode(Double.self, forKey: .carbonLb)
        carbonKg = try attributesContainer.decode(Double.self, forKey: .carbonKg)
        carbonMt = try attributesContainer.decode(Double.self, forKey: .carbonMt)
    }
}
