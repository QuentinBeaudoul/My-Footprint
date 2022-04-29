//
//  AmoutEntryViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 28/04/2022.
//

import UIKit

class AmountEntryViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        headerView.fillView(title: "How much ?", isBackButtonHidden: false)
        headerView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.amountEntryViewController.processSegue.identifier {
            guard let processViewController = segue.destination as? ProcessViewController else {
                return
            }
        }
    }

    @IBAction func onProcessButtonTapped() {
        performSegue(withIdentifier: R.segue.amountEntryViewController.processSegue, sender: nil)
    }
}

extension AmountEntryViewController: HeaderViewDelegate {
    func onBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
