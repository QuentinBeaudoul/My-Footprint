//
//  Date+.swift
//  MFExtensions
//
//  Created by Quentin on 06/05/2022.
//

import Foundation

public extension Date {
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
