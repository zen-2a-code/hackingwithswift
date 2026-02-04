//
//  Habbit.swift
//  Habbit Tracker
//
//  Created by Stoyan Hristov on 3.02.26.
//

import Foundation
import SwiftUI

struct Habbit: Codable, Hashable, Identifiable, Equatable {
    var id: UUID = UUID()
    var title: String
    var description: String?
    var completionCount: Int = 0
    
}

@Observable
class Habbits {
    var habbits: [Habbit] = [] {
        didSet {
            if let encodedData = try? JSONEncoder().encode(habbits) {
                UserDefaults.standard.set(encodedData, forKey: "habbits")
            }
        }
    }
    
    init() {
        if let savedHabbitsEncoudedData = UserDefaults.standard.data(forKey: "habbits") {
            if let decodedHabbits = try? JSONDecoder().decode([Habbit].self, from: savedHabbitsEncoudedData) {
                habbits = decodedHabbits
                return
            }
        }
        habbits = []
    }
    
    func deleteHabbit(_ indexSet: IndexSet) {
        self.habbits.remove(atOffsets: indexSet)
    }
    
    func increaseCompletionCount(for habbit: Habbit) {
        if let index = self.habbits.firstIndex(of: habbit) {
            self.habbits[index].completionCount += 1
        }
    }
}
