//
//  NetworkClient.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 2/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkClientError: Error {
    case invalidURL
    case `default`

    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid url"
        case .default:
            return "Cannot receive data"
        }
    }
}

typealias RequestResponse = Result<Data,NetworkClientError>

protocol NetworkClientProtocol: AnyObject {
    func request(urlRequest: URLRequest, completion: @escaping (RequestResponse) -> Void)
}

final class NetworkClient: NetworkClientProtocol {

    static let shared = NetworkClient()
    
    private init() {}

    func request(urlRequest: URLRequest, completion: @escaping (RequestResponse) -> Void) {
        AF.request(urlRequest)
            .validate(statusCode: 200..<300)
            .response { response in
                self.parseJSONResponse(response: response, completion: completion)
            }
    }
}

extension NetworkClient {
    private func parseJSONResponse(response: AFDataResponse<Data?>, completion: @escaping (RequestResponse) -> Void) {
        switch response.result {
        case .success(let data):
            guard let data = data else {
                completion(.failure(.default))
                return
            }

            completion(.success(data))

        case .failure:
            completion(.failure(.default))
        }
    }
}
