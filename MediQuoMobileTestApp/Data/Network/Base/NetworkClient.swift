//
//  NetworkClient.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 2/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkClientError: Error, Equatable, LocalizedError, CustomStringConvertible {
    static func == (lhs: NetworkClientError, rhs: NetworkClientError) -> Bool {
        lhs.description == rhs.description
    }
    
    case generic
    case apiError([String: Any], Int)
    case parsing(String)
    case noMandatoryParameter(String)
    case unAuthorized
    case imageTooBig
    case noInternetConnection
    case invalidData
    case timeOut
    
    var responseCode:Int {
        switch self {
        case .apiError(_, let code):
            return code
        case .timeOut:
            return NSURLErrorTimedOut
        default:
            return -1
        }
    }
    
    var localizedDescription: String{
        switch self {
        case .unAuthorized:
            return NSLocalizedString("You do not have authorization.", comment: "No tiene autorización.")
        case .imageTooBig:
            return NSLocalizedString("Size is too big.", comment: "El tamaño es demasiado grande.")
        case .parsing(let object):
            return NSLocalizedString("It could not be transformed ", comment: "No se pudo transformar.") + "\(object)"
        case .noMandatoryParameter(let object):
            return NSLocalizedString("The mandatory parameter was not included ", comment: "") + "\(object)"
        case .noInternetConnection:
            return NSLocalizedString("Could not access the network right now, please check your connection", comment: "No se pudo acceder a la red, compruebe su conexión")
        case .timeOut:
            return NSLocalizedString("The request time out",comment:"")
        case .apiError(let json,_):
            if let message = json["localizedError"] as? String {
                return message
            }
            if let message = json["message"] as? String {
                return message
            }
            return NSLocalizedString("An error ocurred.", comment:"")
        default:
            return NSLocalizedString("An error ocurred.", comment:"")
        }
    }
    var description: String {
        return localizedDescription
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
                completion(.failure(.generic))
                return
            }

            completion(.success(data))

        case .failure(let err):
    
            guard let error = err.underlyingError as? URLError else {
                completion(.failure(.generic))
                return
            }

            switch error.code {
            case .timedOut:
                completion(.failure(.timeOut))
            case .notConnectedToInternet:
                completion(.failure(.noInternetConnection))
            default:
                completion(.failure(.generic))
            }
        }
    }
}
