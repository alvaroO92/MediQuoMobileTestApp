//
//  HomeSearchUseCase.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 4/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation

protocol HomeSearchUseCaseProtocol: AnyObject {
    func getCharacters(category: SearchCategory, completion: @escaping (Result<[Character],NetworkClientError>) -> Void)
}

final class HomeSearchUseCase {

    let repository: HomeSearchRepositoryProtocol

    init(repository: HomeSearchRepositoryProtocol) {
        self.repository = repository
    }
}

extension HomeSearchUseCase: HomeSearchUseCaseProtocol {

    func getCharacters(category: SearchCategory, completion: @escaping (Result<[Character], NetworkClientError>) -> Void) {
        repository.getCharacters(category: category) { (response: Result<[Character],NetworkClientError>) in
            switch response {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
