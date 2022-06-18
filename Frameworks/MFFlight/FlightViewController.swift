//
//  FlightViewController.swift
//  MFFlight
//
//  Created by Quentin on 20/04/2022.
//

import UIKit
import MFExtensions
import Combine

class FlightViewController: UIViewController {

    @IBOutlet weak var historyViewTopConstrainte: NSLayoutConstraint!
    @IBOutlet weak var historyImageView: UIImageView!
    @IBOutlet weak var historyViewHeightConstrainte: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noHistoryView: UIView!

    let viewModel = FlightViewModel()
    let publisher = NotificationCenter.default.publisher(for: .electricityHistoryTask)
    var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Set the historyView in the bottom
        historyViewTopConstrainte.constant =
        UIScreen.main.bounds.height -
        UIScreen.headerHeight -
        UIScreen.tabbarHeight -
        60

        // Set the historyView height contrainte
        historyViewHeightConstrainte.constant =
        UIScreen.main.bounds.height -
        UIScreen.tabbarHeight -
        UIScreen.headerHeight

        // Setup no historyView
        historyImageView.image = R.image.ic_100_history()
        noHistoryView.isHidden = viewModel.hasHistory

        // Setup history tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: HistoryCell.getCellIdentifier(),
                                 bundle: Bundle(for: Self.self)),
                           forCellReuseIdentifier: HistoryCell.getCellIdentifier())

        publisher.sink { [self] _ in
            print("notification flight")
            updateHistory()
        }.store(in: &cancellables)
    }

    private func updateHistory() {
        viewModel.reloadHistory { [self] result in
            noHistoryView.isHidden = viewModel.hasHistory
            switch result {
            case .success():
                tableView.reloadData()
            case .failure(let error):
                UIAlertController.showAlert(title: "generic_error".localized(bundle: Bundle(for: Self.self)), message: error.localizedDescription, on: self)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.flightViewController.resultSegue.identifier {
            guard let viewController = segue.destination as? ResultViewController,
                  let estimate = viewModel.chosenEstimate else { return }

            viewController.viewModel.load(estimate)
        }
    }

    @IBAction func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case.up:
            historyViewTopConstrainte.constant = 8
        case.down:
            historyViewTopConstrainte.constant = UIScreen.main.bounds.height -
            UIScreen.headerHeight -
            UIScreen.tabbarHeight -
            60
        default:
            break
        }

        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            sender.view?.superview?.layoutIfNeeded()
        }
    }
}

extension FlightViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.getCellIdentifier(),
                                                       for: indexPath) as? HistoryCell,
              let estimate = viewModel.getItem(at: indexPath) else { return UITableViewCell() }

        cell.fillView(estimate)

        return cell
    }
}

extension FlightViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.chosenEstimate = viewModel.getItem(at: indexPath)
        performSegue(withIdentifier: R.segue.flightViewController.resultSegue, sender: nil)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }

    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [self] _, _, completion in
            viewModel.delete(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .right)
            updateHistory()
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash.fill")?
            .withTintColor(R.color.onPrimaryColor() ?? .white)
        deleteAction.backgroundColor = R.color.deleteColor() ?? .red

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}
