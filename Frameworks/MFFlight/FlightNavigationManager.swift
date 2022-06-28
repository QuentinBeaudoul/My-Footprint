//
//  FlightNavigationManager.swift
//  MFFlight
//
//  Created by Quentin on 20/04/2022.
//

import UIKit
import MFExtensions

public final class FlightNavigationManager {
    public static let shared = FlightNavigationManager()

    private init() {}

    public func getFlightViewController() -> UIViewController {

        let controller = FlightViewController.makeFromStoryboard(in: Bundle(for: Self.self))

        controller.tabBarItem = UITabBarItem(title: nil,
                                                image: R.image.ic_25_airplane(),
                                                selectedImage: R.image.ic_35_airplane())

        return controller
    }
}
