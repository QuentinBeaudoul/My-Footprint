//
//  ShippingNavigationManager.swift
//  MFShipping
//
//  Created by Quentin on 15/04/2022.
//

import UIKit
import MFExtensions

public final class ShippingNavigationManager {

    public static let shared = ShippingNavigationManager()

    private init() {}

    public func getShippingViewController() -> UIViewController {

        let navController = UINavigationController.makeFromStoryboard("Shipping",
                                                                      withIdentifier: "ShippingNavViewController",
                                                                      in: Bundle(for: Self.self))

        navController.tabBarItem = UITabBarItem(title: nil,
                                                 image: UIImage(systemName: "shippingbox"),
                                                 selectedImage: UIImage(systemName: "shippingbox.fill"))

        return navController
    }
}
