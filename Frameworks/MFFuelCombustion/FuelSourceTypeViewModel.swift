//
//  FuelSourceTypeViewModel.swift
//  MFFuelCombustion
//
//  Created by Quentin on 02/05/2022.
//

import Foundation
import MFNetwork

class FuelSourceTypeViewModel {

    private let fuelSources = Constantes.fuelSources
    var selectedFuelSource: FuelEnergySource?
    var isFuelSourceSelected: Bool {
        selectedFuelSource != nil
    }

    func getNumberOfItems() -> Int {
        return fuelSources.count
    }

    func getItem(at indexPath: IndexPath) -> FuelEnergySource {
        return fuelSources[indexPath.row]
    }

    func initRequest() -> Request.Builder? {
        guard let selectedFuelSource = selectedFuelSource else {
            return nil
        }

        let request = Request.Builder()
        request.addParameter(key: RequestKeys.fuelSourceType.rawValue, value: selectedFuelSource.apiName)
        return request
    }

}
