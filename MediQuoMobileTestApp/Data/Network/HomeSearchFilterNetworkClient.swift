//
//  HomeSearchFilterNetworkClient.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 6/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeSearchFilterNetworkClientProtocol: AnyObject {
    func getCharacters(by name: String, completion: @escaping (Result<[CharacterDTO],NetworkClientError>) -> Void)
}
