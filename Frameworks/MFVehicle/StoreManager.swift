//
//  StoreManager.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 21/05/2022.
//

import Foundation
import MFStorage

public final class StoreManager {
    private init() {}

    public static let shared = StoreManager()

    private(set) var history: [Estimate]?

    func addToHistory(estimate: Estimate) {
        guard let entity = GlobalStoreManager.shared.vehicleEntity else { return }
        let context = GlobalStoreManager.shared.context

        let storedEstimate = CDVehicle(entity: entity, insertInto: context)
        storedEstimate.distanceUnit = estimate.distanceUnit
        storedEstimate.distanceValue = "\(estimate.distanceValue)"
        storedEstimate.vehicleModelId = estimate.vehicleModelId
        storedEstimate.vehicleYear = "\(estimate.vehicleYear)"
        storedEstimate.vehicleMake = estimate.vehicleMake
        storedEstimate.vehicleModel = estimate.vehicleModel
        storedEstimate.estimatedAt = estimate.estimatedAt
        storedEstimate.carbonG = estimate.carbonG.toString()
        storedEstimate.carbonLb = estimate.carbonLb.toString()
        storedEstimate.carbonKg = estimate.carbonKg.toString()
        storedEstimate.carbonMt = estimate.carbonMt.toString()

        do {
            try context.save()

            // notify publisher
            NotificationCenter.default.post(name: .vehicleHistoryTask, object: nil, userInfo: nil)

        } catch let error {
            print(error)
        }
    }

    public func loadHistory(completion: ((Result<[Estimate]?, Error>) -> Void)? = nil) {
        let request = CDVehicle.fetchRequest()
        let context = GlobalStoreManager.shared.context

        do {
            let result = try context.fetch(request)

            history = result.compactMap({ cdVehicle in
                Estimate(from: cdVehicle)
            })

            completion?(.success(history))
        } catch let error {
            print(error)
            completion?(.failure(error))
        }
    }

    func removeFromHistory(estimate: Estimate?) {
        guard let estimate = estimate else { return }
        let context = GlobalStoreManager.shared.context

        let request = CDVehicle.fetchRequest()
        request.predicate = NSPredicate(format: "estimatedAt LIKE %@", estimate.estimatedAt)

        do {
            if let historyRowToDelete = try context.fetch(request).first {
                context.delete(historyRowToDelete)
                try context.save()
            }
        } catch let error {
            print(error)
        }
    }
}
