//
//  ProcessResultViewModel.swift
//  MFFlight
//
//  Created by Quentin Beaudoul on 11/06/2022.
//

import Foundation
import MFNetwork

class ProcessResultViewModel {
    let networkManager: NetworkManagerProtocol
    let storeManager: StoreManager

    private(set) var request: Request.Builder?
    private(set) var estimate: Estimate?

    var retryCount = 0
    var noMoreTries: Bool {
        retryCount >= 3
    }

    init(networkManager: NetworkManagerProtocol = NetworkManager.shared,
         storeManager: StoreManager = StoreManager.shared) {
        self.networkManager = networkManager
        self.storeManager = storeManager
    }

    func load(_ request: Request.Builder) {
        self.request = request
    }

    func performRequest(completion: @escaping (Result<Estimate?, Error>) -> Void) {
        guard let request = request else { return }
        let url = Constants.url
        let params: [String: Any] = request.build()

        networkManager.fetchData(httpType: .POST,
                                 apiKey: .carbon,
                                 url: url,
                                 headers: nil,
                                 parameters: params,
                                 parser: Estimate.self) { [weak self] res in
            guard let self = self else { return }
            switch res {
            case .success(let estimate):
                if let estimate = estimate {
                    self.estimate = estimate
                    self.storeManager.addToHistory(estimate: estimate)
                    completion(.success(estimate))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
