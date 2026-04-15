//
//  ContentView-ViewModel.swift
//  HighRollers
//
//  Created by Stoyan Hristov on 13.04.26.
//

import Foundation
import SwiftData

extension ContentView  {
    @Observable
    final class ViewModel {
        var modelContext: ModelContext
        
        let diceSidesMaximumLimit: Int = 100
        let diceCountMaximumLimit: Int = 133
        var diceSides: Int = 6
        var diceCount = 1 {
            didSet {
                self.rolls = Array(repeating: 0, count: self.diceCount)
            }
        }
        var rolls: [Int] = [0]
        var isRolling = false
        private var timer: Timer?
        var showTotal: Bool {
            getTotalRolled() > 0 && isRolling == false
        }
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
        }
        
        func getTotalRolled() -> Int {
            rolls.reduce(0, +)
        }
        
        func resetRolled() {
            self.rolls = Array(repeating: 0, count: self.diceCount)
        }
        
        func rollDice() {
            isRolling = true
            var tickCounter = 0
            timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
                for index in 0..<self.diceCount {
                    self.rolls[index] = Int.random(in: 1...self.diceSides)
                }
                tickCounter += 1
                if tickCounter == 10 {
                    self.stopTimer()
                    self.isRolling = false
                    self.modelContext.insert(Roll(rolledNumber: self.rolls, diceSides: self.diceSides, diceCount: self.diceCount))
                }
            }
        }
        
        private func stopTimer() {
            timer?.invalidate()
            timer = nil
        }
    }
}
