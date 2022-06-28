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

        networkManager.fetchData(httpType: .GET,
                                 apiKey: .airports,
                                 url: url,
                                 headers: nil,
                                 parameters: params,
                                 parser: [Airport].self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let airports):
                self.airports = airports
                completion(.success(airports))
            case .failure(let error):
                // Backup strat if freeplan is gone
                self.airports = Bundle.decode([Airport].self,
                                              from: "Airports.json",
                                              in: Bundle(for: Self.self))
                print(error)
                completion(.failure(error))
            }
        }
    }

    func retriveAirport(from iataCode: String) -> Airport? {
        airports?.first(where: { airport in
            airport.iataCode == iataCode
        })
    }
}
