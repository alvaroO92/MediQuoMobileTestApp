//
//  NetworkProvider.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 2/2/22.
//

import Foundation
import Alamofire

enum NetworkTask {
    case requestPlain
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

protocol NetworkProvider: URLRequestConvertible {
    var url: URL { get }
    var method: HTTPMethod { get }
    var task: NetworkTask { get }
}

extension NetworkProvider {

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method

        switch task {
        case .requestPlain:
            break
        case .requestParameters(let parameters, let encoding):
            urlRequest = try encoding.encode(urlRequest, with: parameters)
        }

        return urlRequest
    }
}
