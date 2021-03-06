//
//  FlightViewModel.swift
//  MFFlight
//
//  Created by Quentin on 20/04/2022.
//

import Foundation

class FlightViewModel {
    let manager: StoreManager

    var history: [Estimate]?

    init(manager: StoreManager = StoreManager.shared) {
        self.manager = manager
        history = manager.history
    }

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

    func delete(at indexPath: IndexPath) {
        manager.removeFromHistory(estimate: history?.remove(at: indexPath.row))
    }

    func reloadHistory(completion: ((Result<Void, Error>) -> Void)?) {
        manager.loadHistory { [self] result in
            switch result {
            case .success(let estimates):
                history = estimates
                completion?(.success())
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
