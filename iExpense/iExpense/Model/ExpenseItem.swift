//
//  Expense.swift
//  iExpense
//
//  Created by Stoyan Hristov on 19.01.26.
//

import Foundation

enum ExpenseCategory {
    case cheap, average, expensive
}

enum ExpenseType: Codable, Identifiable, CaseIterable {
    case personal, business
    
    var id: Self { self }
    var title: String {
        switch self {
        case .personal:
            "Personal"
        case .business:
            "Business"
        }
    }
}

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    var type: ExpenseType
    let amount: Double
    
    var expenseCategory: ExpenseCategory {
        if amount < 10 {
            return .cheap
        } else if amount < 100 {
            return .average
        } else {
            return .expensive
        }
    }
}
