//
//  Estimate.swift
//  MFFlight
//
//  Created by Quentin on 22/04/2022.
//

import Foundation
import MFStorage

public class Estimate: Decodable, Equatable {
    public static func == (lhs: Estimate, rhs: Estimate) -> Bool {
        return lhs.passengers == rhs.passengers &&
        lhs.legs == rhs.legs &&
        lhs.distanceValue == rhs.distanceValue &&
        lhs.distanceUnit == rhs.distanceUnit &&
        lhs.estimatedAt == rhs.estimatedAt &&
        lhs.carbonG == rhs.carbonG &&
        lhs.carbonLb == rhs.carbonLb &&
        lhs.carbonKg == rhs.carbonKg &&
        lhs.carbonMt == rhs.carbonMt
    }

    let passengers: Int
    let legs: [Legs]
    let distanceValue: Double
    let distanceUnit, estimatedAt: String
    let carbonG, carbonLb, carbonKg, carbonMt: Double

    enum ContainerCodingKeys: String, CodingKey {
        case data
    }

    enum MetadataCodingKeys: String, CodingKey {
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

    public init(from entity: CDFlight) {
        passengers = entity.passengers?.toInt() ?? 0
        legs = entity.legs?.array as? [Legs] ?? [Legs]()
        distanceValue = entity.distanceValue?.toDouble() ?? 0
        distanceUnit = entity.distanceUnit ?? ""
        estimatedAt = entity.estimatedAt ?? ""
        carbonG = entity.carbonG?.toDouble() ?? 0
        carbonLb = entity.carbonLb?.toDouble() ?? 0
        carbonKg = entity.carbonKg?.toDouble() ?? 0
        carbonMt = entity.carbonMt?.toDouble() ?? 0
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContainerCodingKeys.self)
        let metadataContainer = try container.nestedContainer(keyedBy: MetadataCodingKeys.self,
                                                              forKey: .data)

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
