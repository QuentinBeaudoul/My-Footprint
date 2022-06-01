//
//  ElectricityNavigationManager.swift
//  MFElectricity
//
//  Created by Quentin on 20/04/2022.
//

import UIKit
import MFExtensions

public final class ElectricityNavigationManager {
    public static let shared = ElectricityNavigationManager()

    private init() {}

    public func getElectricityViewController() -> UIViewController {

        let controller = ElectricityViewController.makeFromStoryboard(in: Bundle(for: Self.self))

        controller.tabBarItem = UITabBarItem(title: nil,
                                                image: R.image.ic_25_electricity(),
                                                selectedImage: R.image.ic_35_electricity())

        return controller
    }
}
