//
//  SplashViewController.swift
//  My Footprint
//
//  Created by Quentin on 15/04/2022.
//

import UIKit
import Lottie
import MFExtensions

class SplashViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Setting up animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 2
        animationView.play()
    }

    // Display the main viewController once history is loaded
    // TODO: Load history here (or in viewWillLoad)
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let mainVC = MainViewController.makeFromStoryboard()
            mainVC.modalPresentationStyle = .overFullScreen
            self.present(mainVC, animated: true)
        }
    }
}
