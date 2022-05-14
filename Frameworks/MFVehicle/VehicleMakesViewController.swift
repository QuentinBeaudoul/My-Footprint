//
//  VehicleMakesViewController.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 14/05/2022.
//

import UIKit
import MFExtensions

class VehicleMakesViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: MFButton!
    
    let viewModel = VehicleMakesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Set up header
        headerView.delegate = self
        headerView.fillView(title: "Which vehicle maker ?")

        // Set up tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: VehicleMakeCell.getCellIdentifier(),
                                 bundle: Bundle(for: Self.self)),
                           forCellReuseIdentifier: VehicleMakeCell.getCellIdentifier())

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.vehicleMakesViewController.vehicleModelSegue.identifier {
            print("load vehicle maker")
        }
    }

}

extension VehicleMakesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VehicleMakeCell.getCellIdentifier(),
                                                       for: indexPath) as? VehicleMakeCell,
              let vehicleMake = viewModel.getItem(at: indexPath) else { return UITableViewCell() }

        cell.fillView(vehicleMake: vehicleMake)

        return cell
    }
}

extension VehicleMakesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedVehicleMake = viewModel.getItem(at: indexPath)
        nextButton.isEnabled = true
        nextButton.alpha = 1.0
    }
}

extension VehicleMakesViewController: HeaderViewDelegate {

    func onBackButtonTapped() {
        dismiss(animated: true)
    }
}