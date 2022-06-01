//
//  ShippingViewController.swift
//  MFShipping
//
//  Created by Quentin on 15/04/2022.
//

import UIKit
import MFExtensions
import Lottie

class ShippingViewController: UIViewController {

    @IBOutlet weak var historyViewTopConstrainte: NSLayoutConstraint!
    @IBOutlet weak var historyImageView: UIImageView!
    @IBOutlet weak var historyViewHeightConstrainte: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noHistoryView: UIView!

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
        // noHistoryView.isHidden = viewModel.hasHistory

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
