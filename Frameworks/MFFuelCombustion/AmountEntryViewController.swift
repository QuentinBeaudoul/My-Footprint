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
    @IBOutlet weak var apiNameLabel: UILabel!
    @IBOutlet weak var apiFullNameLabel: UILabel!
    @IBOutlet weak var equalLabel: UILabel!

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
        textField.setAccessoryView(ProcessKeyboardToolbarView(frame: CGRect(x: 0,
                                                                            y: 0,
                                                                            width: UIScreen.main.bounds.width,
                                                                            height: 48)))

        // SetUp button
        unitButton.setTitle(viewModel.defaultUnit?.name, for: .normal)

        // setUp default unit
        viewModel.unit = viewModel.defaultUnit

        // Update interface with data
        updateUI()
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

            processViewController.viewModel.loadRequest(request: request)
        }
    }

    private func updateUI() {
        let hideHelp = viewModel.isUnitNameAndFullNameSame
        apiNameLabel.isHidden = hideHelp
        apiFullNameLabel.isHidden = hideHelp
        equalLabel.isHidden = hideHelp

        guard let unit = viewModel.unit else { return }

        unitButton.setTitle(unit.name, for: .normal)
        apiNameLabel.text = unit.name
        apiFullNameLabel.text = unit.fullName
    }

    @IBAction func onProcessButtonTapped() {
        performSegue(withIdentifier: R.segue.amountEntryViewController.processSegue, sender: nil)
    }
    @IBAction func unitButtonTapped() {
        let actionSheet = UIAlertController(title: "Choose an unit", message: nil, preferredStyle: .actionSheet)

        viewModel.units?.forEach({ unit in
            let action = UIAlertAction(title: unit.name, style: .default) { [self] _ in
                viewModel.unit = unit
                updateUI()
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

    func onToolBarButtonTapped() {
        onProcessButtonTapped()
    }

    func onTextfieldChanged(_ str: String?) {
        guard let str = str else {
            processButton.isEnabled = false
            return
        }

        processButton.isEnabled = !str.isEmpty
        processButton.alpha = !str.isEmpty ? 1.0 : 0.5
        !str.isEmpty ? textField.enableToolBarButton() : textField.disableToolBarButton()

        viewModel.value = str
    }

    func onClearButtonTapped() {
        print("toto")
    }
}
