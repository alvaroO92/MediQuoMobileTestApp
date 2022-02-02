//
//  NetworkClient.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 2/2/22.
//

import Foundation
import Alamofire

enum NetworkClientError: Error {
    case invalidUrl
    case `default`

    var localizedDescription: String {
        switch self {
        case .invalidUrl:
            return "Invalid url"
        case .default:
            return "Cannot receive data"
        }
    }
}

protocol NetworkClientProtocol: AnyObject {
    func request<T:Codable>(urlRequest: URLRequest, completion: @escaping (Result<T,NetworkClientError>) -> Void)
}

final class NetworkClient: NetworkClientProtocol {

    static let shared = NetworkClient()

    

    func request<T: Codable>(urlRequest: URLRequest, completion: @escaping (Result<T, NetworkClientError>) -> Void) {
        AF.request(urlRequest).response { response in
            print(response)
        }.validate(statusCode: 200..<300)
            .response { response in
                self.parseJSONResponse(response: response, completion: completion)
            }
    }
}

extension NetworkClient {
    private func parseJSONResponse<T: Codable>(response: AFDataResponse<Data?>, completion: @escaping (Result<T, NetworkClientError>) -> Void) {
        switch response.result {
        case .success(let data):
            guard let data = data else {
                completion(.failure(.default))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decoded))
                }
            }
            catch {
                print("Error: \(error.localizedDescription)")
                completion(.failure(.default))
            }

        case .failure:
            completion(.failure(.default))
        }
    }
}
