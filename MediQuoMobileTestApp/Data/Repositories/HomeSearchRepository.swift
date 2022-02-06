//
//  HomeSearchRepository.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 4/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeSearchRepositoryProtocol: AnyObject {
    func getCharacters(category: SearchCategory, completion: @escaping (Result<[Character],NetworkClientError>) -> Void)
}

final class HomeSearchRepository {

    let networkClient: HomeSearchNetworkClientProtocol

    init(networkClient: HomeSearchNetworkClientProtocol) {
        self.networkClient = networkClient
    }
}

extension HomeSearchRepository: HomeSearchRepositoryProtocol {

    func getCharacters(category: SearchCategory, completion: @escaping (Result<[Character], NetworkClientError>) -> Void) {
        networkClient.searchCategory = category
        networkClient.getCharacters { (response: Result<[CharacterDTO],NetworkClientError>) in
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


