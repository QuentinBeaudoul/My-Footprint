//
//  ResultViewModel.swift
//  MFFlight
//
//  Created by Quentin Beaudoul on 11/06/2022.
//

import Foundation

class ResultViewModel {
    private(set) var estimate: Estimate?
    let manager: AirportManager

    init(manager: AirportManager = AirportManager.shared) {
        self.manager = manager
    }

    func load(_ estimate: Estimate) {
        self.estimate = estimate
    }

    func getDepartureAirport() -> Airport? {
        manager.retriveAirport(from: estimate?.legs.first?.departureAirport ?? "")
    }

    func getDestinationAirport() -> Airport? {
        manager.retriveAirport(from: estimate?.legs.first?.destinationAirport ?? "")
    }

    func getDistanceValue() -> String {
        estimate?.distanceValue.toString() ?? ""
    }

    func getDistanceUnit() -> String {
        estimate?.distanceUnit ?? ""
    }

    func getLiteralDistanceUnit() -> String {
        Constants.distanceUnits[getDistanceUnit()] ?? ""
    }

    func getEstimatedAt() -> String {
        estimate?.estimatedAt.toDate()?.getFormattedDate(format: "HH:mm yyyy-MM-dd") ?? ""
    }

    func getCarbonG() -> String {
        estimate?.carbonG.toString() ?? ""
    }

    func getCarbonLb() -> String {
        estimate?.carbonLb.toString() ?? ""
    }

    func getCarbonKg() -> String {
        estimate?.carbonKg.toString() ?? ""
    }

    func getCarbonMt() -> String {
        estimate?.carbonMt.toString() ?? ""
    }
}
