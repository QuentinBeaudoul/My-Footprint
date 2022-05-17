//
//  FuelCombustionViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 20/04/2022.
//

import UIKit
import MFExtensions
import Lottie
import Combine

class FuelCombustionViewController: UIViewController {

    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var historyViewTopConstrainte: NSLayoutConstraint!
    @IBOutlet weak var historyViewHeightContrainte: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var historyImageView: UIImageView!
    @IBOutlet weak var noHistorySubView: UIView!

    let viewModel = FuelCombustionViewModel()

    let publisher = NotificationCenter.default.publisher(for: .fuelCombustionHistoryTask)
    var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Set the historyView top constrainte
        historyViewTopConstrainte.constant =
        UIScreen.main.bounds.height -
        UIScreen.headerHeight -
        UIScreen.tabbarHeight -
        60

        // Set the historyView height constrainte
        historyViewHeightContrainte.constant =
        UIScreen.main.bounds.height -
        UIScreen.tabbarHeight -
        UIScreen.headerHeight

        // Setup history tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: HistoryCell.getCellIdentifier(),
                                 bundle: Bundle(for: Self.self)),
                           forCellReuseIdentifier: HistoryCell.getCellIdentifier())

        // Setup no historyView
        historyImageView.image = R.image.ic_100_history()
        noHistorySubView.isHidden = viewModel.hasHistory

        publisher.sink { [self] _ in
            print("notification")
            updateHistory()
        }.store(in: &cancellables)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }

    private func updateHistory() {
        viewModel.reloadHistory { [self] result in
            noHistorySubView.isHidden = viewModel.hasHistory
            switch result {
            case .success():
                tableView.reloadData()
            case .failure(let error):
                UIAlertController.showAlert(title: "Error", message: error.localizedDescription, on: self)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.fuelCombustionViewController.resultSegue.identifier {
            guard let viewController = segue.destination as? ResultViewController,
                  let estimate = viewModel.chosenEstimate else { return }

            viewController.viewModel.loadEstimate(estimate)
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

extension FuelCombustionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.getCellIdentifier(),
                                                       for: indexPath) as? HistoryCell,
              let estimate = viewModel.getItem(at: indexPath) else { return UITableViewCell() }

        cell.fillView(estimate: estimate)

        return cell
    }
}

extension FuelCombustionViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.chosenEstimate = viewModel.getItem(at: indexPath)
        performSegue(withIdentifier: R.segue.fuelCombustionViewController.resultSegue, sender: nil)
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
        deleteAction.backgroundColor = R.color.backgroundGradientTop() ?? .blue

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}
