//
//  Double+.swift
//  MFExtensions
//
//  Created by Quentin Beaudoul on 10/05/2022.
//

import Foundation

public extension Double {
    func toString() -> String {
        let res = String(format: "%g", self)

        return res.isEmpty ? "0" : res
    }
}
