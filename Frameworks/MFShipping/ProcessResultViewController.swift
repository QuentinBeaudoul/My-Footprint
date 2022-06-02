//
//  ProcessResultViewController.swift
//  MFShipping
//
//  Created by Quentin on 01/06/2022.
//

import UIKit
import Lottie

class ProcessResultViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!

    let viewModel = ProcessResultViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Setting up gradient background color
        if let topColor = R.color.backgroundGradientTop(), let bottomColor = R.color.backgroundGradientBottom() {
            view.setGradientBackground(colorTop: topColor, colorBottom: bottomColor)
        }

        // Set up annimation
        let anim = Animation.named("ShippingAnimation", bundle: Bundle(for: Self.self))
        animationView.animation = anim
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 2
        animationView.play()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        performRequest()
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

    private func handleError(_ error: Error) {
        let action = UIAlertAction(title: "Retry", style: .default) { [self] _ in
            performRequest()
        }

        UIAlertController.showAlert(title: "Error", message: error.localizedDescription, action: action, on: self)
    }

    private func segue() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            performSegue(withIdentifier: R.segue.processResultViewController.resultSegue, sender: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.processResultViewController.resultSegue.identifier {
            guard let resultVC = segue.destination as? ResultViewController,
                  let estimate = viewModel.estimate else { return }

            resultVC.viewModel.load(estimate)
        }
    }

}
