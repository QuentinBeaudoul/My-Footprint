//
//  FuelCombustionViewModel.swift
//  MFFuelCombustion
//
//  Created by Quentin on 20/04/2022.
//

import Foundation

class FuelCombustionViewModel {

    let history = StoreManager.shared.history

    var chosenEstimate: Estimate?

    var numberOfRows: Int {
        history?.count ?? 0
    }

    var hasHistory: Bool {
        numberOfRows > 0
    }

    func getItem(at indexPath: IndexPath) -> Estimate? {
        history?[indexPath.row]
    }
}
