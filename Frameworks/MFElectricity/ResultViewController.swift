//
//  ResultViewController.swift
//  MFElectricity
//
//  Created by Quentin on 03/06/2022.
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
                                   viewModel.getElectricityValue(),
                                   viewModel.getElectricityUnit(),
                                   viewModel.getLiteralCountry())

        if let string = contextLabel.text,
           let electricityValueRange = string.range(of: viewModel.getElectricityValue()),
           let electicityUnitRange = string.range(of: viewModel.getElectricityUnit()),
           let literalCountryRange = string.range(of: viewModel.getLiteralCountry()) {

            let nsElectricityValueRange = NSRange(electricityValueRange, in: string)
            let nsElectricityUnitRange = NSRange(electicityUnitRange, in: string)
            let nsLiteralCountryRange = NSRange(literalCountryRange, in: string)

            let attributedString = NSMutableAttributedString(string: string)
            attributedString.addAttributes([.font: UIFont.demiBoldFont(withSize: 23),
                                            .foregroundColor: UIColor.black],
                                           range: nsElectricityValueRange)
            attributedString.addAttributes([.font: UIFont.demiBoldFont(withSize: 23),
                                            .foregroundColor: UIColor.black],
                                           range: nsElectricityUnitRange)
            attributedString.addAttributes([.font: UIFont.demiBoldFont(withSize: 23),
                                            .foregroundColor: UIColor.black],
                                           range: nsLiteralCountryRange)
            contextLabel.attributedText = attributedString
        }

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
        navigationController?.popToViewController(ofClass: CountryViewController.self) ?? dismiss(animated: true)
    }
}
