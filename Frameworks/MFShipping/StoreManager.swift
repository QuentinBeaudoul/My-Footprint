//
//  StoreManager.swift
//  MFShipping
//
//  Created by Quentin on 02/06/2022.
//

import Foundation
import MFStorage
import CoreData

protocol StoreManagerProtocol {
    var history: [Estimate]? { get }
    var context: NSManagedObjectContext { get }
    func addToHistory(estimate: Estimate)
    func loadHistory(completion: ((Result<[Estimate]?, Error>) -> Void)?)
    func removeFromHistory(estimate: Estimate?)
}

public final class StoreManager: StoreManagerProtocol {
    var context: NSManagedObjectContext
    var shippingEntity: NSEntityDescription? {
        NSEntityDescription.entity(forEntityName: "CDShipping", in: context)
    }

    init(coreDataService: CoreDataServiceProtocol = CoreDataService.shared) {
        self.context = coreDataService.context
    }

    public static let shared = StoreManager()

    private(set) var history: [Estimate]?

    func addToHistory(estimate: Estimate) {
        guard let entity = shippingEntity else { return }

        let storedEstimate = CDShipping(entity: entity, insertInto: context)
        storedEstimate.distanceUnit = estimate.distanceUnit
        storedEstimate.distanceValue = "\(estimate.distanceValue)"
        storedEstimate.weightUnit = estimate.weightUnit
        storedEstimate.weightValue = "\(estimate.weightValue)"
        storedEstimate.transportMethod = estimate.transportMethod
        storedEstimate.estimatedAt = estimate.estimatedAt
        storedEstimate.carbonG = estimate.carbonG.toString()
        storedEstimate.carbonLb = estimate.carbonLb.toString()
        storedEstimate.carbonKg = estimate.carbonKg.toString()
        storedEstimate.carbonMt = estimate.carbonMt.toString()

        do {
            try context.save()

            // notify publisher
            NotificationCenter.default.post(name: .shippingHistoryTask, object: nil, userInfo: nil)

        } catch let error {
            print(error)
        }
    }

    public func loadHistory(completion: ((Result<[Estimate]?, Error>) -> Void)? = nil) {
        let request = CDShipping.fetchRequest()

        do {
            let result = try context.fetch(request)

            history = result.compactMap({ cdShipping in
                Estimate(from: cdShipping)
            })

            completion?(.success(history))
        } catch let error {
            print(error)
            completion?(.failure(error))
        }
    }

    func removeFromHistory(estimate: Estimate?) {
        guard let estimate = estimate else { return }

        let request = CDShipping.fetchRequest()
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
