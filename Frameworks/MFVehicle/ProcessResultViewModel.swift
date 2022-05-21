//
//  ProcessResultViewModel.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 17/05/2022.
//

import Foundation
import MFNetwork

class ProcessResultViewModel {

    private(set) var request: Request.Builder?
    private(set) var estimate: Estimate?

    var retryCount = 0
    var noMoreTries: Bool {
        retryCount >= 3
    }

    func load(_ request: Request.Builder) {
        self.request = request
    }

    func performRequest(completion: @escaping (Result<Estimate?, Error>) -> Void) {
        guard let request = request else { return }
        let url = Constants.estimateUrl
        let params: [String: Any] = request.build()

        NetworkManager.shared.fetchData(httpType: .POST, url: url, parameters: params, parser: Estimate.self) { res in
            switch res {
            case .success(let estimate):
                if let estimate = estimate {
                    self.estimate = estimate
                    StoreManager.shared.addToHistory(estimate: estimate)
                    completion(.success(estimate))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
