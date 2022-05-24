//
//  ResultViewModel.swift
//  MFFuelCombustion
//
//  Created by Quentin on 05/05/2022.
//

import Foundation

class ResultViewModel {
    private(set) var estimate: Estimate?

    func loadEstimate(_ estimate: Estimate) {
        self.estimate = estimate
    }

    func getName() -> String {
        Constantes.fuelSources.first { fuelSource in
            fuelSource.apiName == estimate?.fuelSourceType
        }?.name ?? ""
    }

    func getUnitFullName() -> String {
        let matchs = Constantes.fuelSources.first { fuelSource in
            fuelSource.apiName == estimate?.fuelSourceType
        }?.units

        guard let matchs = matchs, let res = matchs.first(where: { unit in
            unit.apiUnit == estimate?.fuelSourceUnit
        })?.fullName else { return "" }

        return res
    }

    func getEstimatedAt() -> String {
        estimate?.estimatedAt.toDate()?.getFormattedDate(format: "HH:mm yyyy-MM-dd") ?? ""
    }

    func getSourceValue() -> String {
        "\(estimate?.fuelSourceValue ?? 0)"
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
