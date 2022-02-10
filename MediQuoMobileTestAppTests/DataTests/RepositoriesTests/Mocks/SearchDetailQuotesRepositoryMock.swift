//
//  SearchDetailQuotesRepositoryMock.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
@testable import MediQuoMobileTestApp

final class SearchDetailQuotesRepositoryMock: SearchDetailQuotesRepositoryProtocol {
    func quotes(completion: @escaping (Result<[Quote], NetworkClientError>) -> Void) {
        completion(.success([]))
    }
}
