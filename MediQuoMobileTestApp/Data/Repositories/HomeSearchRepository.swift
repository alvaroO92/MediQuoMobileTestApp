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
    var realmDatabase: RealmManagerProtocol
    
    init(networkClient: HomeSearchNetworkClientProtocol, realmDataBase: RealmManagerProtocol) {
        self.networkClient = networkClient
        self.realmDatabase = realmDataBase
    }
}

extension HomeSearchRepository: HomeSearchRepositoryProtocol {

    func getCharacters(category: SearchCategory, completion: @escaping (Result<[Character], NetworkClientError>) -> Void) {
        networkClient.searchCategory = category
        networkClient.getCharacters { (response: Result<[CharacterDTO],NetworkClientError>) in
            switch response {
            case .success(let response):
                /*
                 - Gets the previously stored data and assigns it to the array of identifiers.
                 - Filter the response data to save those that are not already stored in the database.
                 - Write the data to the database
                 */
                let savedData: [CharacterRealm] = self.realmDatabase.objects()
                let savedIds = savedData.compactMap { $0.id }
                let objectsToSave = response
                    .compactMap { CharacterRealm(entity: $0) }
                    .filter { !savedIds.contains($0.id) }
                self.realmDatabase.write(objectsToSave)
                
                let responseBO = response.compactMap { $0.toBO() }
                completion(.success(responseBO))
            case .failure(let error):
                
                guard error == .noInternetConnection else {
                    completion(.failure(error))
                    return
                }

                // MARK: - Get stored data and send with success data
                let savedRealm: [CharacterRealm] = self.realmDatabase.objects()
                let responseBO = savedRealm.compactMap { Character(id: Int($0.id), name: $0.name ?? "", birthday: $0.birthday ?? "", occupation: $0.occupation.toArray(), image: $0.image ?? "", status: $0.status ?? "", appearance: $0.appearance.toArray(), nickname: $0.nickname ?? "", portrayed: $0.portrayed ?? "") }
                completion(.success(responseBO))
            }
        }
    }
}
