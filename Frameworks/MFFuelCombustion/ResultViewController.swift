//
//  ResultViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 28/04/2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!

    let viewModel = ResultViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        headerView.fillView(title: "Your result !", isBackButtonHidden: false)
        headerView.delegate = self
    }

    @IBAction func onDoneButtonTapped() {
        dismiss(animated: true)
    }
}

extension ResultViewController: HeaderViewDelegate {
    func onBackButtonTapped() {
        navigationController?.popToViewController(ofClass: AmountEntryViewController.self)
    }
}
