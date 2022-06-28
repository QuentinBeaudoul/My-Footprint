//
//  UIFont+.swift
//  MFExtensions
//
//  Created by Quentin on 29/04/2022.
//

import UIKit

public extension UIFont {

    static func regularFont(withSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "AvenirNext-Regular", size: size) else { return .systemFont(ofSize: size) }

        return font
    }

    static func boldFont(withSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "AvenirNext-Bold", size: size) else { return .boldSystemFont(ofSize: size) }

        return font
    }

    static func demiBoldFont(withSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "AvenirNext-demiBold", size: size) else { return .systemFont(ofSize: size) }

        return font
    }

}
