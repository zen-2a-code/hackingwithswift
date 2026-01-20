//
//  ExpensesView.swift
//  iExpense
//
//  Created by Stoyan Hristov on 20.01.26.
//

import SwiftUI

struct ExpensesView: View {
    var allExpenses: Expenses
    var body: some View {
        List {
            Section("Personal") {
                let personalItems = filterItems(byType: .personal)
                
                ForEach(personalItems){ item in
                    ExpenseRowView(item: item)
                } .onDelete {offsets in
                    deleteItems(in: personalItems, at: offsets)
                }
            }
            
            Section("Business") {
                let businesItems = filterItems(byType: .business)
                ForEach(filterItems(byType: .business)){ item in
                    ExpenseRowView(item: item)
                }
                .onDelete {offsets in
                    deleteItems(in: businesItems, at: offsets)
                }
            }
        }
    }
    
    func deleteItems(in items: [ExpenseItem], at offsets: IndexSet) {
        let idsToDelete = offsets.map {index in
            items[index].id
        }
        
        allExpenses.items.removeAll {item in
            idsToDelete.contains(item.id)
        }
    }
    
    func filterItems(byType itemType: ExpenseType) -> [ExpenseItem]{
        return allExpenses.items.filter{item in
            item.type == itemType
        }
    }
}

#Preview {
    ExpensesView(allExpenses: Expenses())
}
