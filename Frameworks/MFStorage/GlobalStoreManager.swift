//
//  StoreManager.swift
//  MFStorage
//
//  Created by Quentin on 14/04/2022.
//

import CoreData

public final class GlobalStoreManager {
    public static let shared = GlobalStoreManager()

    public let context: NSManagedObjectContext

    public init(coreDataService: CoreDataServiceProtocol = CoreDataService.shared) {
        self.context = coreDataService.context
    }

    public var fuelCombustionEntity: NSEntityDescription? {
        NSEntityDescription.entity(forEntityName: "CDFuelCombustion", in: context)
    }

    public var vehicleEntity: NSEntityDescription? {
        NSEntityDescription.entity(forEntityName: "CDVehicle", in: context)
    }

    public var shippingEntity: NSEntityDescription? {
        NSEntityDescription.entity(forEntityName: "CDShipping", in: context)
    }

    public var flightEntity: NSEntityDescription? {
        NSEntityDescription.entity(forEntityName: "CDFlight", in: context)
    }
    
    public var electricyEntity: NSEntityDescription? {
        NSEntityDescription.entity(forEntityName: "CDElectricity", in: context)
    }
}
