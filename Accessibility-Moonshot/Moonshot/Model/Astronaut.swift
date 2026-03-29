//
//  File.swift
//  Moonshot
//
//  Created by Stoyan Hristov on 22.01.26.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable {
    var id: String
    let name: String
    var description: String
}
