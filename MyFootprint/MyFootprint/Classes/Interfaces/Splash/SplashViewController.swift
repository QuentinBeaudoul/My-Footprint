//
//  SplashViewController.swift
//  My Footprint
//
//  Created by Quentin on 15/04/2022.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Setting up animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        animationView.play()
    }
}
