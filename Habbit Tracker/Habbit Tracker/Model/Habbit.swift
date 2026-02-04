//
//  Habbit.swift
//  Habbit Tracker
//
//  Created by Stoyan Hristov on 3.02.26.
//

import Foundation
import SwiftUI

struct Habbit: Codable, Hashable, Identifiable, Equatable {
    var id: UUID = .init()
    var title: String
    var description: String?
    var completionCount: Int = 0
}

@Observable
class Habbits {
    var habbits: [Habbit] = [] {
        didSet {
            do {
                let encodedData = try JSONEncoder().encode(habbits)
                try encodedData.write(to: savedHabbits, options: [.atomicWrite, .completeFileProtection])
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }

    let savedHabbits = FileManager.documentsDirectory.appendingPathComponent("SavedHabbits")

    init() {
        if let savedHabbitsEncoudedData = try? Data(contentsOf: savedHabbits) {
            if let decodedHabbits = try? JSONDecoder().decode([Habbit].self, from: savedHabbitsEncoudedData) {
                self.habbits = decodedHabbits
                return
            }
        }
        self.habbits = []
    }

    func deleteHabbit(_ indexSet: IndexSet) {
        habbits.remove(atOffsets: indexSet)
    }

    func increaseCompletionCount(for habbit: Habbit) {
        if let index = habbits.firstIndex(of: habbit) {
            habbits[index].completionCount += 1
        }
    }
}
