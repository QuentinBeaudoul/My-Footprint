//
//  ProcessViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 28/04/2022.
//

import UIKit
import Lottie

class ProcessViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!

    private var resultViewController: ResultViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        let anim = Animation.named("EcoFuelAnimation", bundle: Bundle(for: Self.self))
        animationView.animation = anim
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 2
        animationView.play()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            resultViewController = segue.destination as? ResultViewController
        }
    }
}
