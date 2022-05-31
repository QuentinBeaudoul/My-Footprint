//
//  Estimate.swift
//  MFVehicle
//
//  Created by Quentin on 21/04/2022.
//

import Foundation
import MFStorage

public class Estimate: Decodable, Equatable {
    public static func == (lhs: Estimate, rhs: Estimate) -> Bool {
        return lhs.distanceValue == rhs.distanceValue &&
        lhs.distanceUnit == rhs.distanceUnit &&
        lhs.vehicleMake == rhs.vehicleMake &&
        lhs.vehicleModel == rhs.vehicleModel &&
        lhs.vehicleYear == rhs.vehicleYear &&
        lhs.vehicleModelId == rhs.vehicleModelId &&
        lhs.estimatedAt == rhs.estimatedAt &&
        lhs.carbonG == rhs.carbonG &&
        lhs.carbonKg == rhs.carbonKg &&
        lhs.carbonLb == rhs.carbonLb &&
        lhs.carbonMt == rhs.carbonMt
    }

    let distanceValue: Double
    let vehicleMake, vehicleModel: String
    let vehicleYear: Int
    let vehicleModelId, distanceUnit, estimatedAt: String
    let carbonLb, carbonKg, carbonMt, carbonG: Double

    enum ContainerCodingKeys: String, CodingKey {
        case data
    }

    enum MetadataCodingKeys: String, CodingKey {
        case id
        case attributes
    }

    enum AttributesCodingKeys: String, CodingKey {
        case distanceValue = "distance_value"
        case vehicleMake = "vehicle_make"
        case vehicleModel = "vehicle_model"
        case vehicleYear = "vehicle_year"
        case vehicleModelId = "vehicle_model_id"
        case distanceUnit = "distance_unit"
        case estimatedAt = "estimated_at"
        case carbonG = "carbon_g"
        case carbonLb = "carbon_lb"
        case carbonKg = "carbon_kg"
        case carbonMt = "carbon_mt"
    }

    init(from entity: CDVehicle) {
        distanceValue = entity.distanceValue?.toDouble() ?? 0
        vehicleMake = entity.vehicleMake ?? ""
        vehicleModel = entity.vehicleModel ?? ""
        vehicleYear = entity.vehicleYear?.toInt() ?? 0
        vehicleModelId = entity.vehicleModelId ?? ""
        distanceUnit = entity.distanceUnit ?? ""
        estimatedAt = entity.estimatedAt ?? ""
        carbonG = entity.carbonG?.toDouble() ?? 0
        carbonLb = entity.carbonLb?.toDouble() ?? 0
        carbonKg = entity.carbonKg?.toDouble() ?? 0
        carbonMt = entity.carbonMt?.toDouble() ?? 0
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContainerCodingKeys.self)

        let metadataContainer = try container.nestedContainer(keyedBy: MetadataCodingKeys.self, forKey: .data)

        let attributesContainer = try metadataContainer.nestedContainer(keyedBy: AttributesCodingKeys.self,
                                                                        forKey: .attributes)

        distanceValue = try attributesContainer.decode(Double.self, forKey: .distanceValue)
        vehicleMake = try attributesContainer.decode(String.self, forKey: .vehicleMake)
        vehicleModel = try attributesContainer.decode(String.self, forKey: .vehicleModel)
        vehicleYear = try attributesContainer.decode(Int.self, forKey: .vehicleYear)
        vehicleModelId = try attributesContainer.decode(String.self, forKey: .vehicleModelId)
        distanceUnit = try attributesContainer.decode(String.self, forKey: .distanceUnit)
        estimatedAt = try attributesContainer.decode(String.self, forKey: .estimatedAt)
        carbonG = try attributesContainer.decode(Double.self, forKey: .carbonG)
        carbonLb = try attributesContainer.decode(Double.self, forKey: .carbonLb)
        carbonKg = try attributesContainer.decode(Double.self, forKey: .carbonKg)
        carbonMt = try attributesContainer.decode(Double.self, forKey: .carbonMt)
    }
}
