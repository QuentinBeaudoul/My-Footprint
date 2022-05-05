//
//  ProcessViewController.swift
//  MFFuelCombustion
//
//  Created by Quentin on 28/04/2022.
//

import UIKit
import Lottie

class ProcessViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!

    private var resultViewController: ResultViewController?
    var viewModel = ProcessViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        let anim = Animation.named("EcoFuelAnimation", bundle: Bundle(for: Self.self))
        animationView.animation = anim
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 2
        animationView.play()
    }

    private func segue() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            performSegue(withIdentifier: R.segue.processViewController.resultSegue, sender: nil)
        }
    }

    private func handleError(_ error: Error) {

        let action = UIAlertAction(title: "Retry", style: .default) { [self] _ in
            performRequest()
        }

        UIAlertController.showAlert(title: "Error", message: error.localizedDescription, action: action, on: self)
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
        if segue.identifier == R.segue.processViewController.resultSegue.identifier {
            resultViewController = segue.destination as? ResultViewController

            guard let estimate = viewModel.estimate else {
                return
            }

            resultViewController?.viewModel.loadEstimate(estimate)
        }
    }
}
