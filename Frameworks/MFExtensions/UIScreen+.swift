//
//  UIScreen+.swift
//  MFExtensions
//
//  Created by Quentin on 12/05/2022.
//

import UIKit

public extension UIScreen {
    class var tabbarHeight: Double {
        UIDevice.current.hasNotch ? 83 : 48
    }

    class var headerHeight: Double {
        UIDevice.current.hasNotch ? 107.5 : 83.5
    }

    class var bottomInsetHeight: Double {
        UIDevice.current.hasNotch ? 34.0 : 0
    }
}
