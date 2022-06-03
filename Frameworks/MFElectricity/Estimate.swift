//
//  Estimate.swift
//  MFElectricity
//
//  Created by Quentin on 22/04/2022.
//

import Foundation
import MFStorage

public class Estimate: Decodable, Equatable {

    let country, electricityUnit: String
    let electricityValue: Double
    let estimatedAt: String
    let carbonG, carbonLb, carbonKg, carbonMt: Double

    enum ContainerCodingKeys: String, CodingKey {
        case data
    }

    enum MetadataCodingKeys: String, CodingKey {
        case attributes
    }

    enum AttributesCodingKeys: String, CodingKey {
        case country
        case electricityUnit = "electricity_unit"
        case electricityValue = "electricity_value"
        case estimatedAt = "estimated_at"
        case carbonG = "carbon_g"
        case carbonLb = "carbon_lb"
        case carbonKg = "carbon_kg"
        case carbonMt = "carbon_mt"
    }

    public static func == (lhs: Estimate, rhs: Estimate) -> Bool {
        return lhs.country == rhs.country &&
        lhs.electricityUnit == rhs.electricityUnit &&
        lhs.electricityValue == rhs.electricityValue &&
        lhs.estimatedAt == rhs.estimatedAt &&
        lhs.carbonG == rhs.carbonG &&
        lhs.carbonLb == rhs.carbonLb &&
        lhs.carbonKg == rhs.carbonKg &&
        lhs.carbonMt == rhs.carbonMt
    }

    init(from entity: CDElectricity) {
        country = entity.country ?? ""
        electricityUnit = entity.electricityUnit ?? ""
        electricityValue = entity.electricityValue?.toDouble() ?? 0
        estimatedAt = entity.estimatedAt ?? ""
        carbonG = entity.carbonG?.toDouble() ?? 0
        carbonLb = entity.carbonLb?.toDouble() ?? 0
        carbonKg = entity.carbonKg?.toDouble() ?? 0
        carbonMt = entity.carbonMt?.toDouble() ?? 0
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContainerCodingKeys.self)
        let metadataContainer = try container.nestedContainer(keyedBy: MetadataCodingKeys.self, forKey: .data)

        let attributesContainer = try metadataContainer.nestedContainer(keyedBy: AttributesCodingKeys.self,
                                                                        forKey: .attributes)

        country = try attributesContainer.decode(String.self, forKey: .country)
        electricityUnit = try attributesContainer.decode(String.self, forKey: .electricityUnit)
        electricityValue = try attributesContainer.decode(Double.self, forKey: .electricityValue)
        estimatedAt = try attributesContainer.decode(String.self, forKey: .estimatedAt)
        carbonG = try attributesContainer.decode(Double.self, forKey: .carbonG)
        carbonLb = try attributesContainer.decode(Double.self, forKey: .carbonLb)
        carbonKg = try attributesContainer.decode(Double.self, forKey: .carbonKg)
        carbonMt = try attributesContainer.decode(Double.self, forKey: .carbonMt)
    }

    func getLiteralCountryName() -> String {
        Constants.states.first { curCountry in
            country.uppercased() == curCountry.code
        }?.name ?? ""
    }
}
