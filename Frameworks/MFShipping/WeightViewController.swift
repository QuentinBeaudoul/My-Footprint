//
//  WeightViewController.swift
//  MFShipping
//
//  Created by Quentin on 01/06/2022.
//

import UIKit
import MFAssets

class WeightViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var textField: MFTextfield!
    @IBOutlet weak var unitButton: MFButton!
    @IBOutlet weak var processButton: MFButton!

    let viewModel = WeightViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Set up header
        headerView.delegate = self
        headerView.fillView(title: "Which weight ?")

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
        if segue.identifier == R.segue.weightViewController.distanceSegue.identifier {
            guard let distanceVC = segue.destination as? DistanceViewController,
                  let request = viewModel.initRequest() else { return }

            distanceVC.viewModel.load(request)
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

extension WeightViewController: HeaderViewDelegate {
    func onBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

}

extension WeightViewController: MFTextfieldDelegate {
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

        viewModel.value = Int(str)
    }

    func onToolBarButtonTapped() {
        performSegue(withIdentifier: R.segue.weightViewController.distanceSegue, sender: nil)
    }
}
