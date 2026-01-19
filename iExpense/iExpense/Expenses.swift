//
//  Expenses.swift
//  iExpense
//
//  Created by Stoyan Hristov on 19.01.26.
//

import SwiftUI

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "ExpenseItems")
            }
        }
    }

    init() {
        if let loadedData = UserDefaults.standard.data(forKey: "ExpenseItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: loadedData)  {
                items = decodedItems
            }
        }
    }
}
