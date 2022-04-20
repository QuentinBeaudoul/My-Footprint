//
//  ViewController.swift
//  My Footprint
//
//  Created by Quentin on 14/04/2022.
//

import UIKit
import MFVehicle
import MFShipping

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let vehicleVC = VehicleNavigationManager.shared.getVehicleViewController()
        let shippingVC = ShippingNavigationManager.shared.getShippingViewController()

        setViewControllers([vehicleVC, shippingVC], animated: false)
    }
}
