//
//  UIAlertController+.swift
//  MFExtensions
//
//  Created by Quentin on 02/05/2022.
//

import UIKit

public extension UIAlertController {
    static func showAlert(title: String, message: String = "", action: UIAlertAction? = nil, on viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let action = action {
            alert.addAction(action)
        } else {
            let okAction = UIAlertAction(title: "Ok", style: .default) { action in
                alert.dismiss(animated: true)
            }
            alert.addAction(okAction)
        }

        viewController.present(alert, animated: true)
    }
}
