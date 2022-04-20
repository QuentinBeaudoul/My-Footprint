//
//  ElectricityViewController.swift
//  MFElectricity
//
//  Created by Quentin on 20/04/2022.
//

import UIKit
import MFExtensions

class ElectricityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }
    }
}
