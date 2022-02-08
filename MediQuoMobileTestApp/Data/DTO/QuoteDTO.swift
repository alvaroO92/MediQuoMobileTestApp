//
//  QuoteDTO.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 6/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import Foundation

struct QuoteDTO: Decodable {
    var id: Int
    var message: String
    var author: String
   
    enum CodingKeys: String, CodingKey {
       case id = "quote_id"
       case message = "quote"
       case author
     }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.message = try container.decode(String.self, forKey: .message)
        self.author = try container.decode(String.self, forKey: .author)
    }

    func toBO() -> Quote {
       Quote(id: id, message: message, author: author)
    }
}
