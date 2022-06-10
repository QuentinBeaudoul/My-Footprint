//
//  SelectAirportViewController.swift
//  MFFlight
//
//  Created by Quentin Beaudoul on 07/06/2022.
//

import UIKit
import MFExtensions
import MFAssets
import MapKit

class SelectAirportViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var processButton: MFButton!
    @IBOutlet weak var segmentedControl: MFSegmentedControl!
    @IBOutlet weak var airportListTopConstrainte: NSLayoutConstraint!
    @IBOutlet weak var airportListHeightConstrainte: NSLayoutConstraint!

    let viewModel = SelectAirportViewModel()

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

        // Setup tableView
        tableView.register(UINib(nibName: AirportCell.getCellIdentifier(),
                                 bundle: Bundle(for: Self.self)),
                           forCellReuseIdentifier: AirportCell.getCellIdentifier())
        tableView.delegate = self
        tableView.dataSource = self

        // Setup map
        mapView.delegate = self
        setAnnotations()
    }

    private func setAnnotations() {
        viewModel.airports?.forEach({ airport in
            mapView.addAnnotation(AirportAnnotation(airport: airport))
        })
    }

    private func updateSelectedAirport(airport: Airport) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            viewModel.setDeparture(airport)
        case 1:
            viewModel.setDestination(airport)
        default:
            break
        }
    }

    private func enableProcessButton() {
        if viewModel.departure != nil && viewModel.destination != nil {
            processButton.isEnabled = true
            processButton.alpha = 1.0
        }
    }

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
    @IBAction func onSegmentedControlTapped() {

        viewModel.airports?.forEach({ airport in
            tableView.deselectRow(at: viewModel.getIndexPath(for: airport), animated: false)
        })

        mapView.annotations.forEach { annotation in
            mapView.deselectAnnotation(annotation, animated: true)
        }
    }
}

extension SelectAirportViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AirportCell.getCellIdentifier(),
                                                       for: indexPath) as? AirportCell,
              let airport = viewModel.getItem(at: indexPath) else { return UITableViewCell() }

        cell.fillCell(airport)

        return cell
    }
}

extension SelectAirportViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let airport = viewModel.getItem(at: indexPath) else { return }

        updateSelectedAirport(airport: airport)
        enableProcessButton()

        if let annotation = mapView.annotations.first(where: { annotation in
            (annotation as? AirportAnnotation)?.airport == airport
        }) {

            mapView.setCenter(annotation.coordinate, animated: true)
            mapView.selectAnnotation(annotation, animated: true)
        }
    }
}

extension SelectAirportViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? AirportAnnotation else { return }
        mapView.setCenter(annotation.coordinate, animated: true)
        tableView.selectRow(at: viewModel.getIndexPath(for: annotation.airport),
                            animated: true,
                            scrollPosition: .middle)
        updateSelectedAirport(airport: annotation.airport)
        enableProcessButton()
    }
}
