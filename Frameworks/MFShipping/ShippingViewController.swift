//
//  ShippingViewController.swift
//  MFShipping
//
//  Created by Quentin on 15/04/2022.
//

import UIKit
import MFExtensions

class ShippingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }
    }
}