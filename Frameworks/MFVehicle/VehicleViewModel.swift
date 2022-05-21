//
//  VehiculViewModel.swift
//  MFVehicul
//
//  Created by Quentin on 15/04/2022.
//

import Foundation

class VehicleViewModel {

    let manager: StoreManager

    var history: [Estimate]?

    init() {
        manager = StoreManager.shared
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

    func reloadHistory(completion: @escaping (Result<Void, Error>) -> Void) {
        manager.loadHistory { [self] result in
            switch result {
            case .success(let estimates):
                history = estimates
                completion(.success())
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
