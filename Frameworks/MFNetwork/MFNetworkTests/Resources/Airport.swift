//
//  Airport.swift
//  MFNetworkTests
//
//  Created by Quentin on 20/06/2022.
//

import Foundation

public class Airport: Codable, Equatable {

    let iataCode: String
    let name: String
    let latitude: String
    let longitude: String

    enum CodingKeys: String, CodingKey {
        case iataCode = "iata_code"
        case name = "airport_name"
        case latitude
        case longitude
    }

    public static func == (lhs: Airport, rhs: Airport) -> Bool {
        return lhs.name == rhs.name &&
        lhs.iataCode == rhs.iataCode &&
        lhs.latitude == rhs.latitude &&
        lhs.longitude == rhs.longitude
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        iataCode = try container.decode(String.self, forKey: .iataCode)
        name = try container.decode(String.self, forKey: .name)
        latitude = try container.decode(String.self, forKey: .latitude)
        longitude = try container.decode(String.self, forKey: .longitude)
    }
}
