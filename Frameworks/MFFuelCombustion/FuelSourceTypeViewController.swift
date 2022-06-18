//
//  FuelSourceTypeViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 28/04/2022.
//

import UIKit
import MFAssets

class FuelSourceTypeViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: MFButton!
    @IBOutlet weak var headerHeightConstrainte: NSLayoutConstraint!

    let viewModel = FuelSourceTypeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        headerView.fillView(title: "title_fuel_source".localized(bundle: Bundle(for: Self.self)))
        headerView.delegate = self
        headerHeightConstrainte.constant = headerView.isBackButtonVisible() ? 100 : 56

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: FuelSourceTypeCell.getCellIdentifier(),
                                 bundle: Bundle(for: Self.self)),
                           forCellReuseIdentifier: FuelSourceTypeCell.getCellIdentifier())

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.fuelSourceTypeViewController.amountEntrySegue.identifier {
            guard let amountEntryViewController = segue.destination as? AmountEntryViewController else { return }

            if let request = viewModel.initRequest(), let sourceType = viewModel.selectedFuelSource {
                amountEntryViewController.viewModel.load(fuelSource: sourceType, request)
            } else {
                UIAlertController.showAlert(title: "generic_error".localized(bundle: Bundle(for: Self.self)), on: self)
            }
        }
    }

    @IBAction func onNextButtonTapped() {

        if viewModel.isFuelSourceSelected {
            performSegue(withIdentifier: R.segue.fuelSourceTypeViewController.amountEntrySegue, sender: nil)
        } else {
            UIAlertController.showAlert(title: "make_choice".localized(bundle: Bundle(for: Self.self)),
                                        message: "you_have_to_select_a_value".localized(bundle: Bundle(for: Self.self)),
                                        on: self)
        }
    }
}

extension FuelSourceTypeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FuelSourceTypeCell.getCellIdentifier(),
                                                       for: indexPath) as? FuelSourceTypeCell else {
            return UITableViewCell()
        }

        cell.fillView(viewModel.getItem(at: indexPath))

        return cell
    }
}

extension FuelSourceTypeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedFuelSource = viewModel.getItem(at: indexPath)
        nextButton.isEnabled = true
        nextButton.alpha = 1.0
    }
}

extension FuelSourceTypeViewController: HeaderViewDelegate {

    func onBackButtonTapped() {
        dismiss(animated: true)
    }
}
