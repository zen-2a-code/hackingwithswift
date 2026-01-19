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
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    private let types = ["Personal", "Business"]
    var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value:$amount, format: .currency(code: "EUR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let currentExpense = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(currentExpense)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddExpenseView(expenses: Expenses())
}
