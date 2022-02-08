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
       case occupation = "occupation"
       case image = "img"
       case status
       case appearance
       case nickname
       case portrayed
     }

    init(id: Int, name: String, birthday: String, occupation: [String], image: String, status: String, appearance: [Int], nickname: String, portrayed: String) {
        self.id = id
        self.name = name
        self.birthday = birthday
        self.occupation = occupation
        self.image = image
        self.status = status
        self.appearance = appearance
        self.nickname = nickname
        self.portrayed = portrayed
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
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(birthday, forKey: .birthday)
        try container.encode(occupation, forKey: .occupation)
        try container.encode(image, forKey: .image)
        try container.encode(status, forKey: .status)
        try container.encode(appearance, forKey: .appearance)
        try container.encode(nickname, forKey: .nickname)
        try container.encode(portrayed, forKey: .portrayed)
    }

    func toBO() -> Character {
        Character(id: id, name: name, birthday: birthday, occupation: occupation, image: image, status: status, appearance: appearance, nickname: nickname, portrayed: portrayed)
    }
}
