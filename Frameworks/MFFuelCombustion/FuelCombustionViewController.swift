//
//  FuelCombustionViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 20/04/2022.
//

import UIKit
import MFExtensions
import Lottie

class FuelCombustionViewController: UIViewController {

    @IBOutlet weak var buttonViewHeightContrainte: NSLayoutConstraint!

    private var entryParamsViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // set the button in the center Y position
        // Header height = 71.5
        // Tabbar height = hasNotch ? 75 : 52
        let tabbarHeight = UIDevice.current.hasNotch ? 75 : 52
        let statusBarHeight = UIApplication.statusBarHeight()!
        buttonViewHeightContrainte.constant = UIScreen.main.bounds.maxY - 71.5 - CGFloat(tabbarHeight) - statusBarHeight
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EntryParamsSegue" {
            entryParamsViewController = segue.destination
        }
    }

    @IBAction func onGetStartedTapped() {
        if let entryParamsViewController = entryParamsViewController {
            present(entryParamsViewController, animated: true)
        }
    }
}
