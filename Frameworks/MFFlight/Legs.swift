//
//  Legs.swift
//  MFFlight
//
//  Created by Quentin on 22/04/2022.
//

import Foundation
import MFStorage

class Legs: Decodable, Equatable {
    static func == (lhs: Legs, rhs: Legs) -> Bool {
        return lhs.departureAirport == rhs.departureAirport &&
        lhs.destinationAirport == rhs.destinationAirport
    }

    let departureAirport: String
    let destinationAirport: String

    enum CodingKeys: String, CodingKey {
        case departureAirport = "departure_airport"
        case destinationAirport = "destination_airport"
    }

    init(from entity: CDLeg) {
        departureAirport = entity.departureAirport ?? ""
        destinationAirport = entity.destinationAirport ?? ""
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        departureAirport = try container.decode(String.self, forKey: .departureAirport)
        destinationAirport = try container.decode(String.self, forKey: .destinationAirport)
    }
}
