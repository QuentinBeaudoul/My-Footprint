//
//  UIApplication+.swift
//  MFExtensions
//
//  Created by Quentin on 28/04/2022.
//

import UIKit

public extension UIApplication {
    static func statusBarHeight() -> CGFloat? {
        shared.connectedScenes
                .filter {$0.activationState == .foregroundActive }
                .map {$0 as? UIWindowScene }
                .compactMap { $0 }
                .first?.windows
                .filter({ $0.isKeyWindow }).first?
                .windowScene?.statusBarManager?.statusBarFrame.height
    }
}
