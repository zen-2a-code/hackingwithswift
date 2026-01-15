//
//  Questions.swift
//  Multiply Quest
//
//  Created by Stoyan Hristov on 15.01.26.
//

struct Question {
    var firstNumber: Int
    var secondNumber: Int
    
    init(upTo number: Int) {
        self.firstNumber = Int.random(in: 2...number)
        self.secondNumber = Int.random(in: 2...number)
    }
    
    func getProduct() -> Int {
        firstNumber * secondNumber
    }
    
}
