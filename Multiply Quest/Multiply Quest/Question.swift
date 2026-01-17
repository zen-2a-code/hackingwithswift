//
//  Questions.swift
//  Multiply Quest
//
//  Created by Stoyan Hristov on 15.01.26.
//

import SwiftUI

struct Question {
    var firstNumber: Int
    var secondNumber: Int
    var correctanswer: Int {
        firstNumber * secondNumber
    }
    var isWrong: Bool = false
    
    init(upTo number: Int) {
        self.firstNumber = Int.random(in: 2...number)
        self.secondNumber = Int.random(in: 2...number)
    }
}
