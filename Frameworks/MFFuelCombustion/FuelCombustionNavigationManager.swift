//
//  FuelCombustionNavigationManager.swift
//  MFFuelCombustion
//
//  Created by Quentin on 20/04/2022.
//

import UIKit
import MFExtensions

public final class FuelCombustionNavigationManager {

    public static let shared = FuelCombustionNavigationManager()

    private init() {}

    public func getFuelCombustionViewController() -> UIViewController {

        let navController = UINavigationController.makeFromStoryboard("FuelCombustion",
                                                                      withIdentifier: "FuelCombustionNavViewController",
                                                                      in: Bundle(for: Self.self))

        navController.tabBarItem = UITabBarItem(title: nil,
                                                image: R.image.ic_25_fuel(),
                                                selectedImage: R.image.ic_35_fuel())

        return navController
    }
}
