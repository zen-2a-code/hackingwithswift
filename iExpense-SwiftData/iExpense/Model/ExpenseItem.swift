//
//  Expense.swift
//  iExpense
//
//  Created by Stoyan Hristov on 19.01.26.
//

import SwiftData
import Foundation

enum ExpenseCategory {
    case cheap, average, expensive
}

enum ExpenseType: String, Codable, Identifiable, CaseIterable {
    case personal, business, all
    
    var id: Self { self }
    var title: String {
        switch self {
        case .personal:
            "Personal"
        case .business:
            "Business"
        case .all:
            "All"
        }
    }
}

@Model
class ExpenseItem {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
    
    var expenseCategory: ExpenseCategory {
        if amount < 10 {
            return .cheap
        } else if amount < 100 {
            return .average
        } else {
            return .expensive
        }
    }
    
    var expenseType: ExpenseType {
        ExpenseType(rawValue: type) ?? .personal
    }
    
    init(id: UUID = UUID(), name: String, type: ExpenseType, amount: Double) {
        self.id = id
        self.name = name
        self.type = type.rawValue
        self.amount = amount
    }
}
