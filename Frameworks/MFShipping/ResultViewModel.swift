//
//  ResultViewModel.swift
//  MFShipping
//
//  Created by Quentin on 01/06/2022.
//

import Foundation

class ResultViewModel {
    private(set) var estimate: Estimate?

    func load(_ estimate: Estimate) {
        self.estimate = estimate
    }

    func getDistanceValue() -> String {
        "\(estimate?.distanceValue ?? 0)"
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
        "\(estimate?.carbonG ?? 0)"
    }

    func getCarbonLb() -> String {
        "\(estimate?.carbonLb ?? 0)"
    }

    func getCarbonKg() -> String {
        "\(estimate?.carbonKg ?? 0)"
    }

    func getCarbonMt() -> String {
        "\(estimate?.carbonMt ?? 0)"
    }

    func getTransportMethod() -> String {
        estimate?.transportMethod ?? ""
    }

    func getWeightValue() -> String {
        "\(estimate?.weightValue ?? 0)"
    }

    func getWeightUnit() -> String {
        estimate?.weightUnit ?? ""
    }
}
