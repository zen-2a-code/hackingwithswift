//
//  Card.swift
//  Flashzilla
//
//  Created by Stoyan Hristov on 5.04.26.
//

import Foundation
import SwiftData

@Model
class Card: Identifiable {
    var id = UUID()
    var prompt: String
    var answer: String
    var createdAt = Date()
    
    init(prompt: String, answer: String) {
        self.id = UUID()
        self.prompt = prompt
        self.answer = answer
    }
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
