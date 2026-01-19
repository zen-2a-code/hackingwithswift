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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(allExpenses.items) { item in
                    HStack {
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(Font.headline)
                            Text(item.type)
                        }
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "EUR"))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .sheet(isPresented: $showAddExpenseSheet) {
                AddExpenseView(expenses: allExpenses)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add new expense", systemImage: "plus"){
                  showAddExpenseSheet = true
                }
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet){
        allExpenses.items.remove(atOffsets: offsets)
        
    }
}

#Preview {
    ContentView()
}

