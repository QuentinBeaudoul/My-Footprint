//
//  DistanceViewController.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 17/05/2022.
//

import UIKit
import MFAssets

class DistanceViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var textField: MFTextfield!
    @IBOutlet weak var unitButton: MFButton!
    @IBOutlet weak var processButton: MFButton!

    let viewModel = DistanceViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        hideKeyboardWhenTappedAround()

        // Set up header
        headerView.fillView(title: "How much ?", isBackButtonHidden: false)
        headerView.delegate = self

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
        if segue.identifier == R.segue.distanceViewController.processResultSegue.identifier {
            guard let processResultVC = segue.destination as? ProcessResultViewController,
                  let request = viewModel.appendToRequest() else { return }

            processResultVC.viewModel.load(request)
        }
    }

    @IBAction func onUnitButtonTapped() {
        let actionSheet = UIAlertController(title: "Choose an unit", message: nil, preferredStyle: .actionSheet)

        viewModel.units.forEach { (apiName, fullName) in
            let action = UIAlertAction(title: fullName, style: .default) { [self] _ in
                viewModel.unit = apiName
                updateUI()
            }
            actionSheet.addAction(action)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            actionSheet.dismiss(animated: true)
        }
        actionSheet.addAction(cancelAction)

        present(actionSheet, animated: true)
    }
}

extension DistanceViewController: HeaderViewDelegate {
    func onBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

}

extension DistanceViewController: MFTextfieldDelegate {
    func onClearButtonTapped() {
        print("Todo")
    }

    func onTextfieldChanged(_ str: String?) {
        guard let str = str else {
            processButton.isEnabled = false
            processButton.alpha = 0.5
            return
        }

        processButton.isEnabled = !str.isEmpty
        processButton.alpha = !str.isEmpty ? 1.0 : 0.5
        !str.isEmpty ? textField.enableToolBarButton() : textField.disableToolBarButton()

        viewModel.value = str
    }

    func onToolBarButtonTapped() {
        performSegue(withIdentifier: R.segue.distanceViewController.processResultSegue, sender: nil)
    }
}
