//
//  SearchDetailQuotesUseCase.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 6/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation

protocol SearchDetailQuotesUseCaseProtocol: AnyObject {
    func quotes(completion: @escaping (Result<[Quote],NetworkClientError>) -> Void)
}

final class SearchDetailQuotesUseCase {

    let repository: SearchDetailQuotesRepositoryProtocol

    init(repository: SearchDetailQuotesRepositoryProtocol) {
        self.repository = repository
    }
}

extension SearchDetailQuotesUseCase: SearchDetailQuotesUseCaseProtocol {
    func quotes(completion: @escaping (Result<[Quote], NetworkClientError>) -> Void) {
        repository.quotes { (response: Result<[Quote],NetworkClientError>) in
            switch response {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
