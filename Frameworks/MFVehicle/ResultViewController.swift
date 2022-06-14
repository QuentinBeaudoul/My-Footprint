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
        initContextLabel()

        // Set up labels
        gramsLabel.text = viewModel.getCarbonG()
        poundsLabel.text = viewModel.getCarbonLb()
        kilogramsLabel.text = viewModel.getCarbonKg()
        megatonsLabel.text = viewModel.getCarbonMt()
        estimatedAtLabel.text = viewModel.getEstimatedAt()
    }

    private func initContextLabel() {

        contextLabel.text = String(format: contextLabel.text ?? "",
                                   viewModel.getVehicleYear(),
                                   viewModel.getVehicleMake(),
                                   viewModel.getVehicleModel(),
                                   viewModel.getDistanceValue(),
                                   viewModel.getLiteralDistanceUnit())

        if let string = contextLabel.text,
           let vehicleYearRange = string.range(of: viewModel.getVehicleYear()),
           let vehicleMakeRange = string.range(of: viewModel.getVehicleMake()),
           let vehicleModelRange = string.range(of: viewModel.getVehicleModel()),
           let vehicleDistanceRange = string.range(of: viewModel.getDistanceValue()),
           let literalDistanceUnitRange = string.range(of: viewModel.getLiteralDistanceUnit()) {

            let nsVehicleYearRange = NSRange(vehicleYearRange, in: string)
            let nsVehicleMakeRange = NSRange(vehicleMakeRange, in: string)
            let nsVehicleModelRange = NSRange(vehicleModelRange, in: string)
            let nsVehicleDistanceRange = NSRange(vehicleDistanceRange, in: string)
            let nsLiteralDistanceUnitRange = NSRange(literalDistanceUnitRange, in: string)

            let attributedString = NSMutableAttributedString(string: string)
            attributedString.addAttributes([.font: UIFont.demiBoldFont(withSize: 23),
                                            .foregroundColor: UIColor.black],
                                           range: nsVehicleYearRange)
            attributedString.addAttributes([.font: UIFont.demiBoldFont(withSize: 23),
                                            .foregroundColor: UIColor.black],
                                           range: nsVehicleMakeRange)
            attributedString.addAttributes([.font: UIFont.demiBoldFont(withSize: 23),
                                            .foregroundColor: UIColor.black],
                                           range: nsVehicleModelRange)
            attributedString.addAttributes([.font: UIFont.demiBoldFont(withSize: 23),
                                            .foregroundColor: UIColor.black],
                                           range: nsVehicleDistanceRange)
            attributedString.addAttributes([.font: UIFont.demiBoldFont(withSize: 23),
                                            .foregroundColor: UIColor.black],
                                           range: nsLiteralDistanceUnitRange)
            contextLabel.attributedText = attributedString
        }
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
