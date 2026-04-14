//
//  Roll.swift
//  HighRollers
//
//  Created by Stoyan Hristov on 13.04.26.
//

import Foundation
import SwiftData

@Model
class Roll {
    var rolledNumbers: [Int]
    var createdAt = Date()
    var diceSides: Int
    var dicesCount: Int
    
    var total: Int {
        rolledNumbers.reduce(0, +)
    }
    
    init(rolledNumber: [Int], diceSides: Int, dicesCount: Int) {
        self.rolledNumbers = rolledNumber
        self.diceSides = diceSides
        self.dicesCount = dicesCount
    }
    
    #if DEBUG
    static let example = Roll(rolledNumber: [1, 2, 3, 4, 5], diceSides: 6, dicesCount: 5)
    #endif
}
