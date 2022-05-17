//
//  ProcessVehicleModelsViewController.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 17/05/2022.
//

import UIKit
import Lottie

class ProcessVehicleModelsViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    let viewModel = ProcessVehicleModelsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Set up annimation
        let anim = Animation.named("CarAnimation", bundle: Bundle(for: Self.self))
        animationView.animation = anim
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 2
        animationView.play()
    }

    private func handleError(_ error: Error) {

        let action = UIAlertAction(title: "Retry", style: .default) { [self] _ in
            performRequest()
        }

        UIAlertController.showAlert(title: "Error", message: error.localizedDescription, action: action, on: self)
    }

    private func segue() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            performSegue(withIdentifier: R.segue.processVehicleModelsViewController.vehicleModelsSegue, sender: nil)
        }
    }

    private func performRequest() {
        viewModel.performRequest { [self] response in
            switch response {
            case .success(_):
                segue()
            case .failure(let error):
                viewModel.retryCount += 1

                if viewModel.noMoreTries {
                    navigationController?.popViewController(animated: true)
                } else {
                    handleError(error)
                }
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        performRequest()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == R.segue.processVehicleModelsViewController.vehicleModelsSegue.identifier {

            guard let nextVC = segue.destination as? VehicleModelsViewController,
                  let vehicleModels = viewModel.vehicleModels else { return }

            nextVC.viewModel.load(vehicleModels)
        }
    }

}
