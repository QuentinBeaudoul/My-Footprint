//
//  AmoutEntryViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 28/04/2022.
//

import UIKit

class AmountEntryViewController: UIViewController {

    private var processViewController: ProcessViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.amountEntryViewController.processSegue.identifier {
            processViewController = segue.destination as? ProcessViewController
        }
    }

    @IBAction func onProcessButtonTapped() {
        performSegue(withIdentifier: R.segue.amountEntryViewController.processSegue, sender: nil)
    }
}
