//
//  ResultViewController.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 21/05/2022.
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

        //  Set up context text view
        contextLabel.text = String(format: contextLabel.text ?? "",
                                   viewModel.getVehicleYear(),
                                   viewModel.getVehicleMake(),
                                   viewModel.getVehicleModel(),
                                   viewModel.getDistanceValue(),
                                   viewModel.getLiteralDistanceUnit())

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
        navigationController?.popToViewController(ofClass: DistanceViewController.self) ?? dismiss(animated: true)
    }
}
