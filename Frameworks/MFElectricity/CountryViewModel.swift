//
//  CountryViewModel.swift
//  MFElectricity
//
//  Created by Quentin on 03/06/2022.
//

import Foundation
import MFNetwork

class CountryViewModel {
    private var request: Request.Builder?
    private let countries = Constants.states
    var selectedCountry: Country?

    var numberOfItems: Int {
        countries.count
    }

    func load(_ request: Request.Builder) {
        self.request = request
    }

    func getItem(at indexPath: IndexPath) -> Country {
        countries[indexPath.row]
    }

    func appendToRequest() -> Request.Builder? {
        guard let request = request, let selectedCountry = selectedCountry else {
            return nil
        }

        request.addParameter(key: "country", value: selectedCountry.code)
        return request
    }
}
