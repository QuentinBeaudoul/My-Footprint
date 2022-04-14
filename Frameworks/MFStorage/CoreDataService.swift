//
//  CoreDataService.swift
//  MFStorage
//
//  Created by Quentin on 14/04/2022.
//

import CoreData

public protocol CoreDataServiceProtocol {
    var context: NSManagedObjectContext { get }
}

public final class CoreDataService: CoreDataServiceProtocol {

    public static let shared = CoreDataService()

    private let modelName = "MyFootprint"
    private let modelBundle = Bundle(identifier: "Quentin.Beaudoul.MFStorage")

    private lazy var persistentContainer: NSPersistentContainer = {

        let model = modelBundle!.url(forResource: modelName, withExtension: "momd")!
        let managedObject = NSManagedObjectModel(contentsOf: model)
        let container = NSPersistentContainer(name: modelName, managedObjectModel: managedObject!)

        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })

        return container
    }()

    public var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    private init() {}

}
