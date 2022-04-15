//
//  ViewController.swift
//  My Footprint
//
//  Created by Quentin on 14/04/2022.
//

import UIKit
import MFVehicul
import MFShipping

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let vehiculVC = VehiculNavigationManager.shared.getVehiculViewController()
        let shippingVC = ShippingNavigationManager.shared.getShippingViewController()

        setViewControllers([vehiculVC, shippingVC], animated: false)
    }
}
