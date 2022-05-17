//
//  DistanceViewModel.swift
//  MFVehicle
//
//  Created by Quentin Beaudoul on 17/05/2022.
//

import Foundation
import MFNetwork

class DistanceViewModel {
    private(set) var request: Request.Builder?

    var value: Int?
    var unit: String?

    func load(_ request: Request.Builder) {
        self.request = request
    }
}
