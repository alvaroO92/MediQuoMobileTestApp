//
//  SearchDetailQuotesNetworkClient.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 6/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchDetailQuotesNetworkClientProtocol: AnyObject {
    func quotes(completion: @escaping (Result<[QuoteDTO],NetworkClientError>) -> Void)
}

final class SearchDetailQuotesNetworkClient {
    private var author: String

    init(author: String) {
        self.author = author
    }
}

extension SearchDetailQuotesNetworkClient: NetworkProvider {
    var url: URL? {
        URL(string: NetworkConstants.breakingbadapi + "quote")
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var task: NetworkTask {
        let parameter = ["author": author]
        return NetworkTask.requestParameters(parameters: parameter, encoding: NetworkTask.CustomGetEncoding())
    }
}

extension SearchDetailQuotesNetworkClient: SearchDetailQuotesNetworkClientProtocol {
    func quotes(completion: @escaping (Result<[QuoteDTO], NetworkClientError>) -> Void) {
        
        guard let urlRequest = try? asURLRequest() else {
            completion(.failure(.generic))
            return
        }

        NetworkClient.shared.request(urlRequest: urlRequest) { response in
            switch response {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode([QuoteDTO].self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(.generic))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
