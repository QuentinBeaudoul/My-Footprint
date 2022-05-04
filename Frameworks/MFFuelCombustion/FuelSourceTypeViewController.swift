//
//  FuelSourceTypeViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 28/04/2022.
//

import UIKit

class FuelSourceTypeViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: MFButton!

    let viewModel = FuelSourceTypeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        headerView.fillView(title: "Which energy ?")
        headerView.delegate = self

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
                UIAlertController.showAlert(title: "Something went wrong", on: self)
            }
        }
    }

    @IBAction func onNextButtonTapped() {

        if viewModel.isFuelSourceSelected {
            performSegue(withIdentifier: R.segue.fuelSourceTypeViewController.amountEntrySegue, sender: nil)
        } else {
            UIAlertController.showAlert(title: "Make a choice",
                                        message: "You have to select a value to continue",
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
