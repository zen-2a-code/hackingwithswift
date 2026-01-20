//
//  ContentView.swift
//  iExpense
//
//  Created by Stoyan Hristov on 18.01.26.
//

import SwiftUI

struct ContentView: View {
    @State private var allExpenses = Expenses()
    @State private var showAddExpenseSheet = false
    private let currencyCode = Locale.current.currency?.identifier ?? "EUR"
    
    var body: some View {
        NavigationStack {
            ExpensesView(allExpenses: allExpenses)
            .sheet(isPresented: $showAddExpenseSheet) {
                AddExpenseView(currencyCode: currencyCode, expenses: allExpenses)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add new expense", systemImage: "plus"){
                  showAddExpenseSheet = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

