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
                                                image: UIImage(systemName: "star"),
                                                 selectedImage: UIImage(systemName: "star.fill"))

        return navController
    }
}
