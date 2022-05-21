//
//  ResultViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 28/04/2022.
//

import UIKit
import Combine
import MFAssets

class ResultViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var gramsLabel: UILabel!
    @IBOutlet weak var poundsLabel: UILabel!
    @IBOutlet weak var kilogramsLabel: UILabel!
    @IBOutlet weak var megatonsLabel: UILabel!
    @IBOutlet weak var estimateLabel: UILabel!
    @IBOutlet weak var estimatedAtLabel: UILabel!

    let viewModel = ResultViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Setup header
        headerView.fillView(title: "Your result !", isBackButtonHidden: false)
        headerView.delegate = self

        // Setup estimate with a custom label
        initEstimateLabel()

        // init labels
        gramsLabel.text = viewModel.getCarbonG()
        poundsLabel.text = viewModel.getCarbonLb()
        kilogramsLabel.text = viewModel.getCarbonKg()
        megatonsLabel.text = viewModel.getCarbonMt()
        estimatedAtLabel.text = viewModel.getEstimatedAt()
    }

    fileprivate func initEstimateLabel() {

        let value = viewModel.getSourceValue()
        let unitFullName = viewModel.getUnitFullName()
        let string = String(format: estimateLabel.text ?? "", value, unitFullName)

        if let valueRange = string.range(of: value), let unitRange = string.range(of: unitFullName) {

            let nsValueRange = NSRange(valueRange, in: string)
            let nsUnitRange = NSRange(unitRange, in: string)

            let attributedString = NSMutableAttributedString(string: string)
            attributedString.addAttributes([.font: UIFont.demiBoldFont(withSize: 23),
                                            .foregroundColor: UIColor.black],
                                           range: nsValueRange)
            attributedString.addAttributes([.font: UIFont.demiBoldFont(withSize: 23),
                                            .foregroundColor: UIColor.black],
                                           range: nsUnitRange)

            estimateLabel.attributedText = attributedString
        }
    }

    @IBAction func onDoneButtonTapped() {
        dismiss(animated: true)
    }
}

extension ResultViewController: HeaderViewDelegate {

    // pop view controller if it come from nav. If not, then dismiss (history)
    func onBackButtonTapped() {
        navigationController?.popToViewController(ofClass: AmountEntryViewController.self) ?? dismiss(animated: true)
    }
}
