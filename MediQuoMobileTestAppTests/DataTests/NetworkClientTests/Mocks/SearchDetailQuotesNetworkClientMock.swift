//
//  SearchDetailQuotesNetworkClientMock.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
@testable import MediQuoMobileTestApp

final class SearchDetailQuotesNetworkClientMock: SearchDetailQuotesNetworkClientProtocol {
    func quotes(completion: @escaping (Result<[QuoteDTO], NetworkClientError>) -> Void) {
        if let url = Bundle.main.url(forResource: "Quotes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([QuoteDTO].self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(.apiError([:], -1)))
            }
        }
    }
}
