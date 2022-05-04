//
//  AmoutEntryViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 28/04/2022.
//

import UIKit
import MFExtensions

class AmountEntryViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var textField: MFTextfield!
    @IBOutlet weak var unitButton: MFButton!
    @IBOutlet weak var processButton: MFButton!

    let viewModel = AmountEntryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        hideKeyboardWhenTappedAround()

        // SetUp header
        headerView.fillView(title: "How much ?", isBackButtonHidden: false)
        headerView.delegate = self

        // SetUp textfield
        textField.delegate = self

        // SetUp button
        unitButton.setTitle(viewModel.defaultUnit, for: .normal)

        // setUp default unit
        viewModel.unit = viewModel.defaultUnit

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.amountEntryViewController.processSegue.identifier {
            guard let processViewController = segue.destination as? ProcessViewController else {
                return
            }
            guard let request = viewModel.appendToRequest() else {
                UIAlertController.showAlert(title: "Something went wrong", on: self)
                return
            }

            // TODO: Faire le passage de data vers processVC ici
        }
    }

    @IBAction func onProcessButtonTapped() {
        performSegue(withIdentifier: R.segue.amountEntryViewController.processSegue, sender: nil)
    }
    @IBAction func unitButtonTapped(_ sender: MFButton) {
        let actionSheet = UIAlertController(title: "Choose an unit", message: nil, preferredStyle: .actionSheet)

        viewModel.units?.forEach({ unit in
            let action = UIAlertAction(title: unit.name, style: .default) { [self] _ in
                sender.setTitle(unit.name, for: .normal)
                viewModel.unit = unit.apiUnit
            }
            actionSheet.addAction(action)
        })

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            actionSheet.dismiss(animated: true)
        }
        actionSheet.addAction(cancelAction)

        present(actionSheet, animated: true)
    }
}

extension AmountEntryViewController: HeaderViewDelegate {
    func onBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension AmountEntryViewController: MFTextfieldDelegate {
    func onTextfieldChanged(_ str: String?) {
        guard let str = str else {
            processButton.isEnabled = false
            return
        }

        processButton.isEnabled = !str.isEmpty
        processButton.alpha = !str.isEmpty ? 1.0 : 0.5

        viewModel.value = str
    }

    func onClearButtonTapped() {
        print("toto")
    }
}
