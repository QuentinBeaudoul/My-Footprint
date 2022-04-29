//
//  FuelSourceTypeViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 28/04/2022.
//

import UIKit

class FuelSourceTypeViewController: UIViewController {

    private var amountEntryViewController: AmountEntryViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.fuelSourceTypeViewController.amountEntrySegue.identifier {
            amountEntryViewController = segue.destination as? AmountEntryViewController
        }
    }

    @IBAction func onNextButtonTapped() {
        performSegue(withIdentifier: R.segue.fuelSourceTypeViewController.amountEntrySegue, sender: nil)
    }
}
