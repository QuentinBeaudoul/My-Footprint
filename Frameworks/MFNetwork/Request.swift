//
//  Request.swift
//  MFNetwork
//
//  Created by Quentin on 21/04/2022.
//

import Foundation

public final class Request {
    private init(){}

    public final class Builder {

        private var parameters: [String: Any] = [:]

        public init() {}

        public func addParameter(key: String, value: Any) {
            parameters[key] = value
        }

        public func build() -> [String: Any] {
            return parameters
        }
    }
}
