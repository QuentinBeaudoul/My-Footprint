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

    public func drop(_ key: String?) -> Bool {
//        guard let key = key else { return false }
//
//        let request = CDRecipe.fetchRequest()
//        request.predicate = NSPredicate(format: "label LIKE %@", key)
//
//        do {
//
//            if let recipeToDelete = try context.fetch(request).first {
//                context.delete(recipeToDelete)
//                try context.save()
//                return true
//            }
//
//        } catch let error {
//            print(error)
//            return false
//        }

        return false
    }
}
