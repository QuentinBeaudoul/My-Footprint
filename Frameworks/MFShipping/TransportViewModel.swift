//
//  TransportViewModel.swift
//  MFShipping
//
//  Created by Quentin on 01/06/2022.
//

import Foundation
import MFNetwork

class TransportViewModel {
    private(set) var request: Request.Builder?

    let methods = Constants.transportMethods

    var selectedTransportMethod: String?
    var numberOfItems: Int {
        methods.count
    }

    func load(_ request: Request.Builder) {
        self.request = request
    }

    func getItem(at indexPath: IndexPath) -> String {
        return methods[indexPath.row]
    }

    func appendToRequest() -> Request.Builder? {
        guard let transportMethod = selectedTransportMethod, let request = request else { return nil }

        request.addParameter(key: "transport_method", value: transportMethod)

        return request
    }
}
