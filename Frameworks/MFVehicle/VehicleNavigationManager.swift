//
//  NavigationManager.swift
//  MFVehicul
//
//  Created by Quentin on 15/04/2022.
//

import UIKit
import MFExtensions

public final class VehicleNavigationManager {

    public static let shared = VehicleNavigationManager()

    private init() {}

    public func getVehicleViewController() -> UIViewController {

        let navController = UINavigationController.makeFromStoryboard("Vehicle",
                                                                      withIdentifier: "VehicleNavViewController",
                                                                      in: Bundle(for: Self.self))

        navController.tabBarItem = UITabBarItem(title: nil,
                                                image: R.image.ic_25_car(),
                                                selectedImage: R.image.ic_35_car())

        return navController
    }
}
