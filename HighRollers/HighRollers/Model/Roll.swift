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
    var diceCount: Int
    
    init(rolledNumber: [Int], diceSides: Int, diceCount: Int) {
        self.rolledNumbers = rolledNumber
        self.diceSides = diceSides
        self.diceCount = diceCount
    }
    
    #if DEBUG
    static let example = Roll(rolledNumber: [1, 2, 3, 4, 5], diceSides: 6, diceCount: 5)
    #endif
}
