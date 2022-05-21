//
//  VehicleModelsViewController.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 17/05/2022.
//

import UIKit
import MFAssets

class VehicleModelsViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var processButton: MFButton!

    let viewModel = VehicleModelsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Set up header
        headerView.delegate = self
        headerView.fillView(title: "Which model ?", isBackButtonHidden: false)

        // Set up tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: VehicleModelCell.getCellIdentifier(),
                                 bundle: Bundle(for: Self.self)),
                           forCellReuseIdentifier: VehicleModelCell.getCellIdentifier())
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? DistanceViewController else { return }

        nextVC.viewModel.load(viewModel.initRequest())
    }
}

extension VehicleModelsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VehicleModelCell.getCellIdentifier(),
                                                       for: indexPath) as? VehicleModelCell,
              let vehicleModel = viewModel.getItem(at: indexPath) else { return UITableViewCell() }

        cell.fillCell(vehicleModel)

        return cell
    }
}

extension VehicleModelsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedVehicleModel = viewModel.getItem(at: indexPath)
        processButton.isEnabled = true
        processButton.alpha = 1.0
    }
}

extension VehicleModelsViewController: HeaderViewDelegate {
    func onBackButtonTapped() {
        navigationController?.popToViewController(ofClass: VehicleMakesViewController.self)
    }
}
