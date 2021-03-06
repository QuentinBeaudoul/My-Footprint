//
//  SplashViewController.swift
//  My Footprint
//
//  Created by Quentin on 15/04/2022.
//

import UIKit
import Lottie
import MFFuelCombustion
import MFVehicle
import MFShipping
import MFElectricity
import MFFlight

class SplashViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Setting up gradient background color
        if let topColor = UIColor(named: "backgroundGradientTop"),
           let bottomColor = UIColor(named: "backgroundGradientBottom") {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Setting up animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 2
        animationView.play()
    }

    private func segue() {
        DispatchQueue.main.asyncAfter(deadline: .now() /*+ 2*/) {
            let mainVC = MainViewController.makeFromStoryboard()
            mainVC.modalPresentationStyle = .overFullScreen
            self.present(mainVC, animated: true)
        }
    }

    private func loadHistories() {
        MFFuelCombustion.StoreManager.shared.loadHistory { [self] _ in
            MFVehicle.StoreManager.shared.loadHistory { [self] _ in
                MFShipping.StoreManager.shared.loadHistory { [self] _ in
                    MFElectricity.StoreManager.shared.loadHistory { [self] _ in
                        MFFlight.StoreManager.shared.loadHistory { [self] _ in
                            VehicleManager.shared.getVehicleMakes { [self] _ in
                                AirportManager.shared.fetchAirports { [self] _ in
                                    segue()
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Display the main viewController once history is loaded
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Load histories
        loadHistories()
    }
}
