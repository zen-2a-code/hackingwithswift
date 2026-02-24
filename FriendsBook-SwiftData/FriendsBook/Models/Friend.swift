//
//  Friend.swift
//  FriendsBook
//
//  Created by Stoyan Hristov on 22.02.26.
//

import SwiftData
import Foundation

@Model
class Friend: Codable, Identifiable, Hashable {
    enum CodingKeys: CodingKey {
        case id, name
    }
    
    var id: String
    var name: String
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
}
