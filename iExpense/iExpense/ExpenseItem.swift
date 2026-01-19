//
//  Expense.swift
//  iExpense
//
//  Created by Stoyan Hristov on 19.01.26.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
