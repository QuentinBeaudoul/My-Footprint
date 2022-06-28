//
//  Service.swift
//  MFNetwork
//
//  Created by Quentin on 14/04/2022.
//

import Foundation
import Alamofire

class Service<T : Decodable> {

    class func get(url: String,
                   headers: HTTPHeaders? = nil,
                   parameters: [String: Any]? = nil,
                   parser: T.Type,
                   session: Session,
                   completion: @escaping (DataResponse<T, AFError>) -> Void)  {

        let request = session.request(url, parameters: parameters, headers: headers)
        request.responseDecodable(of: parser, completionHandler: completion)
    }

    class func post(url: String,
                    headers: HTTPHeaders? = nil,
                    parameters: [String: Any]? = nil,
                    parser: T.Type,
                    session: Session,
                    completion: @escaping (DataResponse<T, AFError>) -> Void) {

        let request = session.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        request.responseDecodable(of: parser, completionHandler: completion)
    }
}
