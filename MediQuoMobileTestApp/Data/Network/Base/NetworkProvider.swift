//
//  NetworkProvider.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 2/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkTask {
    case requestPlain
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

extension NetworkTask {
    struct CustomGetEncoding: ParameterEncoding {
        func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
            var request = try URLEncoding().encode(urlRequest, with: parameters)
            
            var urlString = String()
            
            if request.url!.absoluteString.contains("%2B") {
                urlString = request.url!.absoluteString.replacingOccurrences(of: "%2B", with: "+")
            }
            
            if request.url!.absoluteString.contains("%20") {
                urlString = request.url!.absoluteString.replacingOccurrences(of: "%20", with: "+")
            }

            request.url = URL(string: urlString)
            return request
        }
    }
}

protocol NetworkProvider: URLRequestConvertible {
    var url: URL? { get }
    var method: HTTPMethod { get }
    var task: NetworkTask { get }
}

extension NetworkProvider {

    func asURLRequest() throws -> URLRequest {
        guard let url = url else {
            return URLRequest(url: .init(fileURLWithPath: ""))
        }

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
