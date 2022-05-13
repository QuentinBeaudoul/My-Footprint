//
//  VehicleMakes.swift
//  MFVehicle
//
//  Created by Quentin on 13/05/2022.
//

import Foundation

class VehicleMakes: Decodable {
    let id: String
    let name: String
    let numberOfModels: Int

    enum ContainerCodingKeys: String, CodingKey {
        case data
    }

    enum DataCodingKeys: String, CodingKey {
        case id
        case attributes
    }

    enum AttributesCodingKeys: String, CodingKey {
        case name
        case numberOfModels = "number_of_models"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContainerCodingKeys.self)

        let dataContainer = try container.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
        id = try dataContainer.decode(String.self, forKey: .id)

        let attributesContainer = try dataContainer.nestedContainer(keyedBy: AttributesCodingKeys.self, forKey: .attributes)
        name = try attributesContainer.decode(String.self, forKey: .name)
        numberOfModels = try attributesContainer.decode(Int.self, forKey: .numberOfModels)
    }
}
