//
//  CharacterRealm.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 6/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
import RealmSwift

final class CharacterRealm: Object {
    
    typealias EntityType = CharacterDTO

    @objc dynamic var id : Int64 = 0
    @objc dynamic var name: String?
    @objc dynamic var birthday: String?
    dynamic var occupation = List<String>()
    @objc dynamic var image: String?
    @objc dynamic var status: String?
    dynamic var appearance = List<Int>()
    @objc dynamic var nickname: String?
    @objc dynamic var portrayed: String?

    override class func primaryKey() -> String? {
        "id"
    }
    
    convenience required init(entity: EntityType) {
        self.init()
        self.id = Int64(entity.id)
        self.name = entity.name
        self.birthday = entity.birthday
        self.occupation = convertArrayToList(array: entity.occupation)
        self.image = entity.image
        self.status = entity.status
        self.appearance = convertArrayToList(array: entity.appearance)
        self.nickname = entity.nickname
        self.portrayed = entity.portrayed
    }

    private func convertArrayToList<T>(array: [T]?) -> List<T> {
        let list = List<T>()
        array?.forEach { list.append($0) }
        return list
    }
}

