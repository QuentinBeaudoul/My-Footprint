//
//  Request.swift
//  MFNetwork
//
//  Created by Quentin on 21/04/2022.
//

import Foundation

final class Request {
    private init(){}

    final class Builder {

        private var parameters: [String: Any] = [:]

        func addParameter(key: String, value: Any) {
            parameters[key] = value
        }

        func build() -> [String: Any] {
            return parameters
        }
    }
}
