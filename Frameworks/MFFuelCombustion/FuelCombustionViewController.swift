//
//  FuelCombustionViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 20/04/2022.
//

import UIKit
import MFExtensions

class FuelCombustionViewController: UIViewController {

//    @IBOutlet weak var animationView: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

//        // Setting up animation
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = .loop
//        animationView.animationSpeed = 2
//        animationView.play()
    }
}
