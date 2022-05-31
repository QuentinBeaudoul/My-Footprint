//
//  StoreManager.swift
//  MFFuelCombustion
//
//  Created by Quentin Beaudoul on 10/05/2022.
//

import Foundation
import MFStorage
import MFExtensions
import CoreData

protocol StoreManagerProtocol {
    var history: [Estimate]? { get }
    var context: NSManagedObjectContext { get }
    func addToHistory(estimate: Estimate)
    func loadHistory(completion: ((Result<[Estimate]?, Error>) -> Void)?)
    func removeFromHistory(estimate: Estimate?)
}

public final class StoreManager: StoreManagerProtocol {

    public var context: NSManagedObjectContext

    public var fuelCombustionEntity: NSEntityDescription? {
        NSEntityDescription.entity(forEntityName: "CDFuelCombustion", in: context)
    }

    init(coreDataService: CoreDataServiceProtocol = CoreDataService.shared) {
        self.context = coreDataService.context
    }

    public static let shared = StoreManager()

    private(set) var history: [Estimate]?

    func addToHistory(estimate: Estimate) {
        guard let entity = fuelCombustionEntity else { return }

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

            // notify publisher
            NotificationCenter.default.post(name: .fuelCombustionHistoryTask, object: nil, userInfo: nil)

        } catch let error {
            print(error)
        }
    }

    public func loadHistory(completion: ((Result<[Estimate]?, Error>) -> Void)? = nil) {
        let request = CDFuelCombustion.fetchRequest()

        do {
            let result = try context.fetch(request)

            history = result.compactMap({ cdFuelCombustion in
                Estimate(from: cdFuelCombustion)
            })

            completion?(.success(history))
        } catch let error {
            print(error)
            completion?(.failure(error))
        }
    }

    func removeFromHistory(estimate: Estimate?) {
        guard let estimate = estimate else { return }

        let request = CDFuelCombustion.fetchRequest()
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
