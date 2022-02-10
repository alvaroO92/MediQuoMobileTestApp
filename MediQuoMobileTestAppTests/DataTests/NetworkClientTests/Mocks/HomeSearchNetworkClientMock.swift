//
//  HomeSearchNetworkClientMock.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
@testable import MediQuoMobileTestApp

final class HomeSearchNetworkClientMock: HomeSearchNetworkClientProtocol {
    var searchCategory: SearchCategory = .BetterCallSaul
    
    func getCharacters(completion: @escaping (Result<[CharacterDTO], NetworkClientError>) -> Void) {
        if let url = Bundle.main.url(forResource: "BetterCallSaulCharacters", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([CharacterDTO].self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(.apiError([:], -1)))
            }
        }
    }
}
