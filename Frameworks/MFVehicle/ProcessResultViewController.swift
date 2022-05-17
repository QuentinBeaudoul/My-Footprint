//
//  ProcessResultViewController.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 17/05/2022.
//

import UIKit
import Lottie

class ProcessResultViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Set up annimation
        let anim = Animation.named("CarAnimation", bundle: Bundle(for: Self.self))
        animationView.animation = anim
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 2
        animationView.play()
    }
}
