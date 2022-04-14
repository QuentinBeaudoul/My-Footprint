//
//  StoreManager.swift
//  MFStorage
//
//  Created by Quentin on 14/04/2022.
//

import CoreData

public final class StoreManager {
    public static let shared = StoreManager()

    public let context: NSManagedObjectContext

    public init(coreDataService: CoreDataServiceProtocol = CoreDataService.shared) {
        self.context = coreDataService.context
    }

    public func saveContext() -> Bool {
        do {
            try context.save()
            return true
        } catch let error {
            print(error)
            return false
        }
    }

    // TODO: Do CRUD here
}
