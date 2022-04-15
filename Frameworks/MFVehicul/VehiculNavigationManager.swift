//
//  NavigationManager.swift
//  MFVehicul
//
//  Created by Quentin on 15/04/2022.
//

import UIKit
import MFExtensions

public final class VehiculNavigationManager {

    public static let shared = VehiculNavigationManager()

    private init() {}

    public func getVehiculViewController() -> UIViewController {

        let navController = UINavigationController.makeFromStoryboard("Vehicul",
                                                                      withIdentifier: "VehiculNavViewController",
                                                                      in: Bundle(for: Self.self))

        navController.tabBarItem = UITabBarItem(title: nil,
                                                image: UIImage(systemName: "star"),
                                                 selectedImage: UIImage(systemName: "star.fill"))

        return navController
    }
}
