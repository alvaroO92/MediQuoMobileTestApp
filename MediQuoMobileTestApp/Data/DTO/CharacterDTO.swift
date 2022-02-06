//
//  CharacterDTO.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 2/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation

struct CharacterDTO: Decodable {
    var id: Int
    var name: String
    var birthday: String
    var occupation: [String]
    var image: String
    var status: String
    var appearance: [Int]
    var nickname: String
    var portrayed: String

    enum CodingKeys: String, CodingKey {
       case id = "char_id"
       case name
       case birthday
       case occupation
       case image = "img"
       case status
       case appearance
       case nickname
       case portrayed
     }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.birthday = try container.decode(String.self, forKey: .birthday)
        self.occupation = try container.decode([String].self, forKey: .occupation)
        self.image = try container.decode(String.self, forKey: .image)
        self.status = try container.decode(String.self, forKey: .status)
        self.appearance = try container.decode([Int].self, forKey: .appearance)
        self.nickname = try container.decode(String.self, forKey: .nickname)
        self.portrayed = try container.decode(String.self, forKey: .portrayed)
    }

    func toBO() -> Character {
        Character(id: id, name: name, birthday: birthday, occupation: occupation, image: image, status: status, appearance: appearance, nickname: nickname, portrayed: portrayed)
    }
}
