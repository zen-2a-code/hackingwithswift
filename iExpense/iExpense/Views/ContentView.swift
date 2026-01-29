//
//  ContentView.swift
//  iExpense
//
//  Created by Stoyan Hristov on 18.01.26.
//

import SwiftUI

struct ContentView: View {
    @State private var allExpenses = Expenses()
    private let currencyCode = Locale.current.currency?.identifier ?? "EUR"

    var body: some View {
        NavigationStack {
            ExpensesView(allExpenses: allExpenses)
                .navigationTitle("iExpense")
                .toolbar {
                    NavigationLink {
                        AddExpenseView(currencyCode: currencyCode, expenses: allExpenses)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
