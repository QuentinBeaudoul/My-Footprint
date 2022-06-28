//
//  ProcessViewModel.swift
//  MFFuelCombustion
//
//  Created by Quentin on 05/05/2022.
//

import Foundation
import MFNetwork
import MFStorage

class ProcessViewModel {
    private(set) var request: Request.Builder?
    private(set) var estimate: Estimate?

    private let networkManager: NetworkManagerProtocol
    private let storeManager: StoreManagerProtocol

    var retryCount = 0
    var noMoreTries: Bool {
        retryCount >= 3
    }

    init(networkManager: NetworkManagerProtocol = NetworkManager.shared,
         storeManager: StoreManagerProtocol = StoreManager.shared) {
        self.networkManager = networkManager
        self.storeManager = storeManager
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

        networkManager.fetchData(httpType: .POST,
                                 apiKey: .carbon,
                                 url: url,
                                 headers: nil,
                                 parameters: body,
                                 parser: Estimate.self) { [weak self] response in
            guard let self = self else { return }
            switch response {
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
