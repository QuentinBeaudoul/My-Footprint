//
//  NetworkManager.swift
//  MFNetwork
//
//  Created by Quentin on 14/04/2022.
//

import Foundation
import Alamofire

public protocol NetworkManagerProtocol {
    func fetchData<T: Decodable>(httpType: HttpType, apiKey: ApiKeyTypes, url: String, headers: [String: String]?, parameters: [String: Any]?, parser: T.Type, completion: @escaping (Result<T?, Error>) -> Void)
}

public enum HttpType {
    case GET, POST
}

public class NetworkManager: NetworkManagerProtocol {

    public static let shared = NetworkManager()

    private let session: Session

    init(session: Session = AF) {
        self.session = session
    }

    public func fetchData<T: Decodable>(httpType: HttpType, apiKey: ApiKeyTypes, url: String, headers: [String: String]? = nil, parameters: [String: Any]? = nil, parser: T.Type, completion: @escaping (Result<T?, Error>) -> Void) {

        // Initiate headers and adding defaults values like apiKey
        var afHeaders = HTTPHeaders()

        if apiKey.rawValue == ApiKeyTypes.carbon.rawValue {
            afHeaders.add(.authorization(bearerToken: apiKey.rawValue))
        }

        // add all customs headers
        if let headers = headers {
            for header in headers {
                afHeaders.add(name: header.key, value: header.value)
            }
        }

        // Excute request depending of httpType
        switch httpType {
        case .GET:
            Service.get(url: url, headers: afHeaders, parameters: parameters, parser: parser, session: session) { [self] response in
                handleResponse(response: response, completion: completion)
            }
        case .POST:
            Service.post(url: url, headers: afHeaders, parameters: parameters, parser: parser, session: session) { [self] response in
                handleResponse(response: response, completion: completion)
            }
        }
    }

    private func handleResponse<T: Decodable>(response: DataResponse<T, AFError>, completion: @escaping (Result<T?, Error>) -> Void) {
        if let error = response.error {
            print("‼️\(error)‼️")
            completion(.failure(error))
        } else {
            completion(.success(response.value))
        }
    }
}
