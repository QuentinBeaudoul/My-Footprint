//
//  SelectAirportViewController.swift
//  MFFlight
//
//  Created by Quentin Beaudoul on 07/06/2022.
//

import UIKit
import MFExtensions
import MFAssets

class SelectAirportViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var airportListTopConstrainte: NSLayoutConstraint!
    @IBOutlet weak var airportListHeightConstrainte: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Set the historyView in the bottom
        airportListTopConstrainte.constant =
        UIScreen.main.bounds.height -
        UIScreen.headerHeight -
        UIScreen.tabbarHeight -
        60

        // Set the historyView height contrainte
        airportListHeightConstrainte.constant =
        UIScreen.main.bounds.height -
        UIScreen.headerHeight
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case.up:
            airportListTopConstrainte.constant = 16
        case.down:
            airportListTopConstrainte.constant = UIScreen.main.bounds.height -
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
    @IBAction func onCloseButtonTapped() {
        dismiss(animated: true)
    }

}
