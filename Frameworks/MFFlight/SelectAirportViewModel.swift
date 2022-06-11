//
//  SelectAirportViewModel.swift
//  MFFlight
//
//  Created by Quentin on 10/06/2022.
//

import Foundation
import MFNetwork

class SelectAirportViewModel {
    let manager: AirportManager
    let airports: [Airport]?

    private(set) var destination: Airport?
    private(set) var departure: Airport?

    var numberOfItems: Int {
        airports?.count ?? 0
    }

    init(manager: AirportManager = AirportManager.shared) {
        self.manager = manager
        self.airports = manager.airports
    }

    func getItem(at indexPath: IndexPath) -> Airport? {
        airports?[indexPath.row]
    }

    func getIndexPath(for airport: Airport) -> IndexPath {
        IndexPath(row: airports?.firstIndex(of: airport) ?? 0, section: 0)
    }

    func setDestination(_ airport: Airport) {
        destination = airport
    }

    func setDeparture(_ airport: Airport) {
        departure = airport
    }

    func initRequest() -> Request.Builder? {
        guard let destination = destination,
              let departure = departure else {
            return nil
        }
        let request = Request.Builder()
        let legs = ["departure_airport": departure.iataCode, "destination_airport": destination.iataCode]

        request.addParameter(key: "type", value: "flight")
        request.addParameter(key: "legs", value: [legs])

        return request
    }
}
