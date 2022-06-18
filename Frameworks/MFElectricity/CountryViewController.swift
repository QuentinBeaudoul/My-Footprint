//
//  CountryViewController.swift
//  MFElectricity
//
//  Created by Quentin on 03/06/2022.
//

import UIKit
import MFAssets

class CountryViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var processButton: MFButton!
    @IBOutlet weak var headerHeightConstrainte: NSLayoutConstraint!

    let viewModel = CountryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Set up header
        headerView.delegate = self
        headerView.fillView(title: "title_country".localized(bundle: Bundle(for: Self.self)), isBackButtonHidden: false)
        headerHeightConstrainte.constant = headerView.isBackButtonVisible() ? 100 : 56

        // Set up tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CountryCell.getCellIdentifier(),
                                 bundle: Bundle(for: Self.self)),
                           forCellReuseIdentifier: CountryCell.getCellIdentifier())
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? ProcessResultViewController,
              let request = viewModel.appendToRequest() else { return }

        nextVC.viewModel.load(request)
    }
}

extension CountryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.getCellIdentifier(),
                                                       for: indexPath) as? CountryCell else { return UITableViewCell() }

        let country = viewModel.getItem(at: indexPath)
        cell.fillCell(country)

        return cell
    }
}

extension CountryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedCountry = viewModel.getItem(at: indexPath)
        processButton.isEnabled = true
        processButton.alpha = 1.0
    }
}

extension CountryViewController: HeaderViewDelegate {
    func onBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
