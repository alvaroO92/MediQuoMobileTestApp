//
//  HomeSearchNetworkClient.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 4/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeSearchNetworkClientProtocol: AnyObject {
    var searchCategory: SearchCategory { get set }
    func getCharacters(completion: @escaping (Result<[CharacterDTO],NetworkClientError>) -> Void)
}

final class HomeSearchNetworkClient {
    private var category: SearchCategory

    init(category: SearchCategory) {
        self.category = category
    }
}

extension HomeSearchNetworkClient: NetworkProvider {
    var url: URL? {
        URL(string: NetworkConstants.breakingbadapi + "characters")
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var task: NetworkTask {
        let parameter = ["category": category.rawValue]
        return NetworkTask.requestParameters(parameters: parameter, encoding: NetworkTask.CustomGetEncoding())
    }
}

extension HomeSearchNetworkClient: HomeSearchNetworkClientProtocol {

    var searchCategory: SearchCategory {
        get {
            category
        }
        set {
            category = newValue
        }
    }
    
    func getCharacters(completion: @escaping (Result<[CharacterDTO],NetworkClientError>) -> Void) {
        
        guard let urlRequest = try? asURLRequest() else {
            completion(.failure(.generic))
            return
        }

        NetworkClient.shared.request(urlRequest: urlRequest) { response in
            switch response {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode([CharacterDTO].self, from: data)
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
