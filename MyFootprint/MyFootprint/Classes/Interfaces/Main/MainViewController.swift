//
//  ViewController.swift
//  My Footprint
//
//  Created by Quentin on 14/04/2022.
//

import UIKit
import MFVehicle
import MFShipping
import MFFuelCombustion
import MFFlight
import MFElectricity

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let fuelCombustionVC = FuelCombustionNavigationManager.shared.getFuelCombustionViewController()
        let vehicleVC = VehicleNavigationManager.shared.getVehicleViewController()
        let shippingVC = ShippingNavigationManager.shared.getShippingViewController()
        let flightVC = FlightNavigationManager.shared.getFlightViewController()
        let electricityVC = ElectricityNavigationManager.shared.getElectricityViewController()

        setViewControllers([fuelCombustionVC, vehicleVC, shippingVC, flightVC, electricityVC], animated: false)

        selectedViewController = shippingVC
    }
}
