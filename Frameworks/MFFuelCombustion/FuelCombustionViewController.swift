//
//  FuelCombustionViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 20/04/2022.
//

import UIKit
import MFExtensions
import Lottie

class FuelCombustionViewController: UIViewController {

    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var historyViewHeightConstrainte: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Set the historyView in the bottom
        historyViewHeightConstrainte.constant = UIScreen.main.bounds.maxY * 0.7

        // Set Pan gesture for HistoryView

    }
    @IBAction func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case.up:
            historyViewHeightConstrainte.constant = 8
        case.down:
            historyViewHeightConstrainte.constant = UIScreen.main.bounds.maxY * 0.7
        default:
            break
        }

        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            sender.view?.superview?.layoutIfNeeded()
        }
    }
}
