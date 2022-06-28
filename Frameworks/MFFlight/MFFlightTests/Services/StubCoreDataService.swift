//
//  StubCoreDataService.swift
//  MFFlightTests
//
//  Created by Quentin on 13/06/2022.
//

import Foundation
import MFStorage
import CoreData

class StubCoreDataService: CoreDataServiceProtocol {

    private let modelName = "MyFootprint"
    private let modelBundle = Bundle(identifier: "Quentin.Beaudoul.MFStorage")

    lazy var persistentContainer: NSPersistentContainer = {

        let model = modelBundle!.url(forResource: modelName, withExtension: "momd")!
        let managedObject = NSManagedObjectModel(contentsOf: model)
        let container = NSPersistentContainer(name: modelName, managedObjectModel: managedObject!)

        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false

        container.persistentStoreDescriptions = [description]

        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })

        return container
    }()

    var context: NSManagedObjectContext {
        persistentContainer.newBackgroundContext()
    }
}
