//
//  SearchDetailQuotesRepository.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 6/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation

protocol SearchDetailQuotesRepositoryProtocol: AnyObject {
    func quotes(completion: @escaping (Result<[Quote],NetworkClientError>) -> Void)
}

final class SearchDetailQuotesRepository {

    let networkClient: SearchDetailQuotesNetworkClientProtocol

    init(networkClient: SearchDetailQuotesNetworkClientProtocol) {
        self.networkClient = networkClient
    }
}

extension SearchDetailQuotesRepository: SearchDetailQuotesRepositoryProtocol {
    func quotes(completion: @escaping (Result<[Quote], NetworkClientError>) -> Void) {
        networkClient.quotes { (response: Result<[QuoteDTO],NetworkClientError>) in
            switch response {
            case .success(let response):
                let responseBO = response.compactMap { $0.toBO() }
                completion(.success(responseBO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
