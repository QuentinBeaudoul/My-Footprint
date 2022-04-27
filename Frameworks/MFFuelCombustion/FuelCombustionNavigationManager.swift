//
//  FuelCombustionNavigationManager.swift
//  MFFuelCombustion
//
//  Created by Quentin on 20/04/2022.
//

import UIKit

public final class FuelCombustionNavigationManager {

    public static let shared = FuelCombustionNavigationManager()

    private init() {}

    public func getFuelCombustionViewController() -> UIViewController {

        let viewController = FuelCombustionViewController.makeFromStoryboard(in: Bundle(for: Self.self))

        viewController.tabBarItem = UITabBarItem(title: nil,
                                                image: R.image.ic_25_fuel(),
                                                selectedImage: R.image.ic_35_fuel())

        return viewController
    }
}
