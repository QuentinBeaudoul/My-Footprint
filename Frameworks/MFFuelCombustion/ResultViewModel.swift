//
//  ResultViewModel.swift
//  MFFuelCombustion
//
//  Created by Quentin on 05/05/2022.
//

import Foundation

class ResultViewModel {
    private(set) var estimate: Estimate?

    func loadEstimate(_ estimate: Estimate) {
        self.estimate = estimate
    }
}
