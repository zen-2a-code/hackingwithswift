//
//  Student.swift
//  Bookworm-technical-CoreData
//
//  Created by Stoyan Hristov on 11.02.26.
//

import SwiftData
import Foundation

@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
