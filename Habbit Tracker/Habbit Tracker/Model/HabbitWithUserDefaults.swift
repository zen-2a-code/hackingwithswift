//
//  HabbitWithUserDefaults.swift
//  HabbitWithUserDefaults Tracker
//
//  Created by Stoyan Hristov on 4.02.26.
//

import Foundation
import SwiftUI

struct HabbitWithUserDefaults: Codable, Hashable, Identifiable, Equatable {
    var id: UUID = .init()
    var title: String
    var description: String?
    var completionCount: Int = 0
}

/// This class is saved just for refrence on how to save data with UserDefaults. The best practice is to store the data in Documents
@Observable
class HabbitsWithUserDefaults {
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
                self.habbits = decodedHabbits
                return
            }
        }
        self.habbits = []
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
