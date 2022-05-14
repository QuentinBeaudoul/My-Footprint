//
//  ProcessViewModel.swift
//  MFFuelCombustion
//
//  Created by Quentin on 05/05/2022.
//

import Foundation
import MFNetwork

class ProcessViewModel {
    private(set) var request: Request.Builder?
    private(set) var estimate: Estimate?

    var retryCount = 0
    var noMoreTries: Bool {
        retryCount >= 3
    }

    func loadRequest(request: Request.Builder?) {
        self.request = request
    }

    func performRequest(completion: @escaping (Result<Estimate, Error>) -> Void) {
        guard let request = request else {
            return
        }

        let url = Constantes.url
        let body = request.build()

        NetworkManager.shared.fetchData(httpType: .POST,
                                        url: url, parameters: body,
                                        parser: Estimate.self) { response in
            switch response {
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
