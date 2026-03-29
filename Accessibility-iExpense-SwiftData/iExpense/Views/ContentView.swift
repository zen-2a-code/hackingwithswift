//
//  ContentView.swift
//  iExpense
//
//  Created by Stoyan Hristov on 18.01.26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var sortOrder: [SortDescriptor<ExpenseItem>] = [
        SortDescriptor(\.id)
    ]

    @State private var filter: ExpenseType = .all
    @State private var sortByName: Bool = true

    var body: some View {
        NavigationStack {
            HStack(spacing: 5) {
                Spacer()
                Button(sortByName ? "Sort by amount" : "Sort by name") {
                    sortOrder = sortByName ? [SortDescriptor(\.name)] : [SortDescriptor(\.amount)]
                    sortByName.toggle()
                }
                Menu("Filter", systemImage: "arrow.up.arrow.down") {
                    Picker("Filter by", selection: $filter) {
                        ForEach(ExpenseType.allCases) { expenseType in
                            Text(expenseType.title).tag(expenseType)
                        }
                    }
                }
            }
            .padding(.horizontal)
            ExpensesView(filter: filter, sortOrder: sortOrder)
                .navigationTitle("iExpense")
                .toolbar {
                    NavigationLink {
                        AddExpenseView()
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
