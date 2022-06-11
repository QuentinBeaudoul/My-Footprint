//
//  AirportManager.swift
//  MFFlight
//
//  Created by Quentin on 10/06/2022.
//

import Foundation
import MFNetwork

public final class AirportManager {

    var airports: [Airport]?
    let networkManager: NetworkManagerProtocol

    public static let shared = AirportManager()

    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }

    public func fetchAirports(completion: @escaping (Result<[Airport]?, Error>) -> Void) {
        let url = Constants.airportUrl
        let params = ["access_key": ApiKeyTypes.airports.rawValue]

        // TODO: Uncomment this
//        networkManager.fetchData(httpType: .GET,
//                                 apiKey: .airports,
//                                 url: url,
//                                 headers: nil,
//                                 parameters: params,
//                                 parser: [Airport].self) { result in
//            switch result {
//            case .success(let airports):
//                self.airports = airports
//                completion(.success(airports))
//            case .failure(let error):
//                // Backup strat if freeplan is gone
//                self.airports = Bundle.decode([Airport].self,
//                                              from: "Airports.json",
//                                              in: Bundle(for: Self.self))
//                print(error)
//                completion(.failure(error))
//            }
//        }

        // TMP
        self.airports = Bundle.decode([Airport].self,
                                      from: "Airports.json",
                                      in: Bundle(for: Self.self))
        completion(.success(airports))
    }

    func retriveAirport(from iataCode: String) -> Airport? {
        airports?.first(where: { airport in
            airport.iataCode == iataCode
        })
    }
}
