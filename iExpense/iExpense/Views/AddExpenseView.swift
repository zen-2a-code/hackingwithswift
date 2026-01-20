//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Stoyan Hristov on 19.01.26.
//

import SwiftUI

struct AddExpenseView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var type: ExpenseType = .personal
    @State private var amount = 0.0
    let currencyCode: String
    
    private let types = ["Personal", "Business"]
    var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(ExpenseType.allCases) {expenseType in
                        Text(expenseType.title).tag(expenseType)
                    }
                }
                
                TextField("Amount", value:$amount, format: .currency(code: currencyCode))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let currentExpense = ExpenseItem(name: name, type: type, amount: amount)
                    
                    expenses.items.insert(currentExpense, at: 0)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddExpenseView(currencyCode: "EUR", expenses: Expenses())
}
