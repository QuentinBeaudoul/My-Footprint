//
//  ResultViewModel.swift
//  MFElectricity
//
//  Created by Quentin on 03/06/2022.
//

import Foundation

class ResultViewModel {
    private(set) var estimate: Estimate?

    func load(_ estimate: Estimate) {
        self.estimate = estimate
    }

    func getElectricityUnit() -> String {
        estimate?.electricityUnit ?? ""
    }

    func getElectricityValue() -> String {
        estimate?.electricityValue.toString() ?? ""
    }

    func getCountryCode() -> String {
        estimate?.country ?? ""
    }

    func getLiteralCountry() -> String {
        estimate?.getLiteralCountryName() ?? ""
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
