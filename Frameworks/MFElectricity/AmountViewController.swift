//
//  AmountViewController.swift
//  MFElectricity
//
//  Created by Quentin on 03/06/2022.
//

import UIKit
import MFAssets

class AmountViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var textField: MFTextfield!
    @IBOutlet weak var unitButton: MFButton!
    @IBOutlet weak var processButton: MFButton!

    let viewModel = AmountViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        hideKeyboardWhenTappedAround()

        // Set up header
        headerView.fillView(title: "title_amount".localized(bundle: Bundle(for: Self.self)))

        // Set up textfield
        textField.delegate = self
        textField.setAccessoryView(ProcessKeyboardToolbarView(frame: CGRect(x: 0,
                                                                            y: 0,
                                                                            width: UIScreen.main.bounds.width,
                                                                            height: 48)))

        // Set up unit button with first value
        unitButton.setTitle(viewModel.units.first?.key, for: .normal)
    }

    private func updateUI() {
        unitButton.setTitle(viewModel.unit, for: .normal)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.amountViewController.countrySegue.identifier {
            guard let countryVC = segue.destination as? CountryViewController,
                  let request = viewModel.initRequest() else { return }

            countryVC.viewModel.load(request)
        }
    }

    @IBAction func onUnitButtonTapped() {
        let actionSheet = UIAlertController(title: "choose_unit".localized(bundle: Bundle(for: Self.self)), message: nil, preferredStyle: .actionSheet)

        viewModel.units.forEach { (apiName, fullName) in
            let action = UIAlertAction(title: fullName, style: .default) { [self] _ in
                viewModel.unit = apiName
                updateUI()
            }
            actionSheet.addAction(action)
        }

        let cancelAction = UIAlertAction(title: "cancel".localized(bundle: Bundle(for: Self.self)), style: .cancel) { _ in
            actionSheet.dismiss(animated: true)
        }
        actionSheet.addAction(cancelAction)

        present(actionSheet, animated: true)
    }
}

extension AmountViewController: MFTextfieldDelegate {
    func onClearButtonTapped() {
        print("Todo")
    }

    func onTextfieldChanged(_ str: String?) {
        guard let str = str, let value = Int(str) else {
            processButton.isEnabled = false
            processButton.alpha = 0.5
            textField.disableToolBarButton()
            return
        }

        processButton.isEnabled = !str.isEmpty && value >= 1
        processButton.alpha = !str.isEmpty && value >= 1 ? 1.0 : 0.5
        !str.isEmpty && value >= 1 ? textField.enableToolBarButton() : textField.disableToolBarButton()

        viewModel.value = str
    }

    func onToolBarButtonTapped() {
        performSegue(withIdentifier: R.segue.amountViewController.countrySegue, sender: nil)
    }

}
