//
//  UINavigationController+.swift
//  MFExtensions
//
//  Created by Quentin on 29/04/2022.
//

import UIKit

public extension UINavigationController {
  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
    }
  }
}
