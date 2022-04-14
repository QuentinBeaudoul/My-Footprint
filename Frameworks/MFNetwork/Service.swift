//
//  Service.swift
//  MFNetwork
//
//  Created by Quentin on 14/04/2022.
//

import Foundation
import Alamofire

class Service<T : Decodable> {

    class func get(url: String, headers: HTTPHeaders? = nil, parameters: [String: Any]? = nil, parser: T.Type, completion: @escaping (DataResponse<T, AFError>) -> Void)  {

        let request = AF.request(url, parameters: parameters, headers: headers)
        request.responseDecodable(of: parser, completionHandler: completion)
    }

    class func post(url: String, header: [String: Any]? = nil, parameters: [String: Any], parser: T.Type, completion: @escaping (DataResponse<T, AFError>) -> Void) {
        let request = AF.request(url, method: .post, parameters: parameters)
        request.responseDecodable(of: parser, completionHandler: completion)
    }
}
