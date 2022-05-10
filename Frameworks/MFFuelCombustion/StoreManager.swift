//
//  StoreManager.swift
//  MFFuelCombustion
//
//  Created by Quentin Beaudoul on 10/05/2022.
//

import Foundation
import MFStorage
import MFExtensions

public final class StoreManager {
    private init() {}

    public static let shared = StoreManager()

    func add(estimate: Estimate) {
        guard let entity = GlobalStoreManager.shared.fuelCombustionEntity else { return }
        let context = GlobalStoreManager.shared.context

        let storedEstimate = CDFuelCombustion(entity: entity, insertInto: context)
        storedEstimate.fuelSourceType = estimate.fuelSourceType
        storedEstimate.fuelSourceUnit = estimate.fuelSourceUnit
        storedEstimate.fuelSourceValue = estimate.fuelSourceValue.toString()
        storedEstimate.estimatedAt = estimate.estimatedAt
        storedEstimate.carbonG = estimate.carbonG.toString()
        storedEstimate.carbonLb = estimate.carbonLb.toString()
        storedEstimate.carbonKg = estimate.carbonKg.toString()
        storedEstimate.carbonMt = estimate.carbonMt.toString()

        do {
            try context.save()
        } catch let error {
            print(error)
        }
    }

    func loadHistory(completion: (Result<[CDFuelCombustion], Error>) -> Void) {
        let request = CDFuelCombustion.fetchRequest()
        let context = GlobalStoreManager.shared.context

        do {
            let history = try context.fetch(request)
            completion(.success(history))
        } catch let error {
            print(error)
            completion(.failure(error))
        }
    }

    func remove(estimate: Estimate?) -> Bool {
        guard let estimate = estimate else { return false }
        let context = GlobalStoreManager.shared.context

        let request = CDFuelCombustion.fetchRequest()
        request.predicate = NSPredicate(format: "estimatedAt LIKE %@", estimate.estimatedAt)

        do {
            if let historyRowToDelete = try context.fetch(request).first {
                context.delete(historyRowToDelete)
                try context.save()
                return true
            }
        } catch let error {
            print(error)
            return false
        }

        return false
    }
}
