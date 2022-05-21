//
//  String+.swift
//  MFExtensions
//
//  Created by Quentin on 06/05/2022.
//

import Foundation

public extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return dateFormatter.date(from: self)
    }

    func toDouble() -> Double? {
        return Double(self)
    }

    func toInt() -> Int? {
        return Int(self)
    }
}
