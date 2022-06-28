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

    func getTransportMethod() -> String {
        estimate?.transportMethod ?? ""
    }

    func getWeightValue() -> String {
        estimate?.weightValue.toString() ?? ""
    }

    func getWeightUnit() -> String {
        estimate?.weightUnit ?? ""
    }
}
