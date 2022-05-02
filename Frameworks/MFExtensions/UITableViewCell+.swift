//
//  UITableViewCell.swift
//  MFExtensions
//
//  Created by Quentin on 02/05/2022.
//

import Foundation

import UIKit

public extension UITableViewCell {

    class func getCellIdentifier() -> String {
        return String(describing: self)
    }
}
