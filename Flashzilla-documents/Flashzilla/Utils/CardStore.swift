//
//  CardStore.swift
//  Flashzilla-documents
//
//  Created by Stoyan Hristov on 9.04.26.
//

import Foundation

enum CardStore {
    private static let docPath = URL.documentsDirectory.appending(path: "cards.json")
    
    static func save(_ cards: [Card]) {
        do {
            let encodedData = try JSONEncoder().encode(cards)
            try encodedData.write(to: docPath)
        } catch {
            print("Unable to save to documents: \(error.localizedDescription)")
        }
    }
    
    static func load() -> [Card] {
        do {
            let data = try Data(contentsOf: docPath)
            let cards = try JSONDecoder().decode(Array<Card>.self, from: data)
            return cards
            
        } catch {
            return []
        }
    }
}
