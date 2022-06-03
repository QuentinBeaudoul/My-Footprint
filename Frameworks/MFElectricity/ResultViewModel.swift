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
        "\(estimate?.electricityValue ?? 0)"
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
}
