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

        let viewController = ShippingViewController.makeFromStoryboard(in: Bundle(for: Self.self))

        viewController.tabBarItem = UITabBarItem(title: nil,
                                                image: R.image.ic_25_shipping(),
                                                selectedImage: R.image.ic_35_shipping())

        return viewController
    }
}
