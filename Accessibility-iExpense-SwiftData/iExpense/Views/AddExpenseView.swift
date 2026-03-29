//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Stoyan Hristov on 19.01.26.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var name = ""
    @State private var type: ExpenseType = .personal
    @State private var amount = 0.0
    
    private let currencyCode = Locale.current.currency?.identifier ?? "EUR"
    
    var body: some View {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(ExpenseType.allCases) {expenseType in

                        if expenseType == .all {
                            EmptyView()
                        } else {
                            Text(expenseType.title).tag(expenseType)
                        }
                    }
                }
                
                TextField("Amount", value:$amount, format: .currency(code: currencyCode))
                    .keyboardType(.decimalPad)
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let currentExpense = ExpenseItem(name: name, type: type, amount: amount)
                    
                    modelContext.insert(currentExpense)
                    dismiss()
                }
            }
        
    }
}

#Preview {
    AddExpenseView()
}
