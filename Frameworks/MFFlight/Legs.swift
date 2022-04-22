//
//  Legs.swift
//  MFFlight
//
//  Created by Quentin on 22/04/2022.
//

import Foundation

class Legs: Decodable {
    let departureAirport: String
    let destinationAirport: String

    enum CodingKeys: String, CodingKey {
        case departureAirport = "departure_airport"
        case destinationAirport = "destination_airport"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        departureAirport = try container.decode(String.self, forKey: .departureAirport)
        destinationAirport = try container.decode(String.self, forKey: .destinationAirport)
    }
}
