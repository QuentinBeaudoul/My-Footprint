//
//  Result+.swift
//  MFExtensions
//
//  Created by Quentin Beaudoul on 10/05/2022.
//

import Foundation

public extension Result where Success == Void {
    static func success() -> Self { .success(()) }
}
