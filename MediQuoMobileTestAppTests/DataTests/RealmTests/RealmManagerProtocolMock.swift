//
//  RealmManagerProtocolMock.swift
//  MediQuoMobileTestAppTests
//
//  Created by Alvaro Orti Moreno on 10/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
import RealmSwift
@testable import MediQuoMobileTestApp

final class RealmManagerProtocolMock: RealmManagerProtocol {

    func object<T>() -> T? {
        CharacterDTO(id: 0, name: "", birthday: "", occupation: [], image: "", status: "", appearance: [], nickname: "", portrayed: "") as? T
    }
    
    func object<T>(_ key: Any?) -> T? {
        CharacterDTO(id: 0, name: "", birthday: "", occupation: [], image: "", status: "", appearance: [], nickname: "", portrayed: "") as? T
    }
    
    func object<T>(_ predicate: (T) -> Bool) -> T? {
        CharacterDTO(id: 0, name: "", birthday: "", occupation: [], image: "", status: "", appearance: [], nickname: "", portrayed: "") as? T
    }
    
    func objects<T>() -> [T] {
        [CharacterDTO(id: 0, name: "", birthday: "", occupation: [], image: "", status: "", appearance: [], nickname: "", portrayed: "")] as? [T] ?? []
    }
    
    func objects<T>(_ predicate: (T) -> Bool) -> [T] {
        [CharacterDTO(id: 0, name: "", birthday: "", occupation: [], image: "", status: "", appearance: [], nickname: "", portrayed: "")] as? [T] ?? []
    }
    
    func write<T>(_ object: T?) -> Bool {
        true
    }
    
    func write<T>(_ objects: [T]?) -> Bool {
        true
    }
    
    func update(_ block: () -> ()) -> Bool {
        true
    }
    
    func delete<T>(_ object: T) -> Bool {
        true
    }
}
