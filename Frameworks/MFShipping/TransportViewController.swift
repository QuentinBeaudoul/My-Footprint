//
//  TransportViewController.swift
//  MFShipping
//
//  Created by Quentin on 01/06/2022.
//

import UIKit
import MFAssets

class TransportViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var headerHeightConstrainte: NSLayoutConstraint!

    let viewModel = TransportViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        hideKeyboardWhenTappedAround()

        // Set up header
        headerView.fillView(title: "Which method ?", isBackButtonHidden: false)
        headerView.delegate = self
        headerHeightConstrainte.constant = headerView.isBackButtonVisible() ? 100 : 56

        // Setup tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: TransportCell.getCellIdentifier(),
                                 bundle: Bundle(for: Self.self)),
                           forCellReuseIdentifier: TransportCell.getCellIdentifier())
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let processResultVC = segue.destination as? ProcessResultViewController,
              let request = viewModel.appendToRequest() else { return }

        processResultVC.viewModel.load(request)
    }
}

extension TransportViewController: HeaderViewDelegate {
    func onBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension TransportViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransportCell.getCellIdentifier(),
                                                       for: indexPath) as? TransportCell
        else { return UITableViewCell() }

        cell.fillView(method: viewModel.getItem(at: indexPath))

        return cell
    }
}

extension TransportViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedTransportMethod = viewModel.getItem(at: indexPath)
        performSegue(withIdentifier: R.segue.transportViewController.processResultSegue, sender: nil)
    }
}
