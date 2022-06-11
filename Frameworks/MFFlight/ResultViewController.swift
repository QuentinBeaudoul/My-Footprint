//
//  ResultViewController.swift
//  MFFlight
//
//  Created by Quentin Beaudoul on 07/06/2022.
//
import UIKit
import MFAssets

class ResultViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var contextLabel: UILabel!
    @IBOutlet weak var gramsLabel: UILabel!
    @IBOutlet weak var poundsLabel: UILabel!
    @IBOutlet weak var kilogramsLabel: UILabel!
    @IBOutlet weak var megatonsLabel: UILabel!
    @IBOutlet weak var estimatedAtLabel: UILabel!
    @IBOutlet weak var headerHeightConstrainte: NSLayoutConstraint!

    let viewModel = ResultViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Set up headerView
        headerView.fillView(title: "Your result !", isBackButtonHidden: false)
        headerView.delegate = self
        headerHeightConstrainte.constant = headerView.isBackButtonVisible() ? 100 : 56

        //  Set up context text view
        contextLabel.text = String(format: contextLabel.text ?? "",
                                   viewModel.getDistanceValue(),
                                   viewModel.getLiteralDistanceUnit(),
                                   viewModel.getDepartureAirport()?.name ?? "",
                                   viewModel.getDestinationAirport()?.name ?? "")

        // Set up labels
        gramsLabel.text = viewModel.getCarbonG()
        poundsLabel.text = viewModel.getCarbonLb()
        kilogramsLabel.text = viewModel.getCarbonKg()
        megatonsLabel.text = viewModel.getCarbonMt()
        estimatedAtLabel.text = viewModel.getEstimatedAt()
    }

    @IBAction func onDoneButtonTapped() {
        dismiss(animated: true)
    }
}

extension ResultViewController: HeaderViewDelegate {
    func onBackButtonTapped() {
        navigationController?.popToViewController(ofClass: SelectAirportViewController.self) ?? dismiss(animated: true)
    }
}
