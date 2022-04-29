//
//  FuelSourceTypeViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 28/04/2022.
//

import UIKit

class FuelSourceTypeViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        headerView.fillView(title: "Which energy ?")
        headerView.delegate = self

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.fuelSourceTypeViewController.amountEntrySegue.identifier {
            guard let amountEntryViewController = segue.destination as? AmountEntryViewController else {

                return
            }
        }
    }

    @IBAction func onNextButtonTapped() {
        performSegue(withIdentifier: R.segue.fuelSourceTypeViewController.amountEntrySegue, sender: nil)
    }
}

extension FuelSourceTypeViewController: HeaderViewDelegate {

    func onBackButtonTapped() {
        dismiss(animated: true)
    }
}
