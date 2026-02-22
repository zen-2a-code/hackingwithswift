//
//  Friend.swift
//  FriendsBook
//
//  Created by Stoyan Hristov on 22.02.26.
//

import Foundation

struct Friend: Codable, Identifiable, Hashable {
    var id: String
    var name: String
}
