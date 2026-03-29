//
//  ExpensesView.swift
//  iExpense
//
//  Created by Stoyan Hristov on 20.01.26.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var allExpenses: [ExpenseItem]

    var body: some View {
        List {
            ForEach(allExpenses) { expense in
                ExpenseRowView(item: expense)
            }.onDelete { offsets in
//                deleteItems(in: allExpenses, at: offsets)
            }
        }
    }
    
    init(filter: ExpenseType, sortOrder: [SortDescriptor<ExpenseItem>]) {
        
        let selectedExpenseType: String = filter.rawValue
        
        _allExpenses = Query(filter: #Predicate<ExpenseItem>{expense in
            
            if selectedExpenseType == "all" {
                return expense.type == "personal" || expense.type == "business"
            } else {
                return expense.type == selectedExpenseType
            }
        } , sort: sortOrder, animation: .default)
      }

//    func deleteItems(in items: [ExpenseItem], at offsets: IndexSet) {
//        let idsToDelete = offsets.map { index in
//            items[index].id
//        }

//        modelContext.delete(model: #Predicate<ExpenseItem>{ item in
//            idsToDelete.contains(item.id)
//        }
//        allExpenses.items.removeAll {item in
//            idsToDelete.contains(item.id)
//        }
//    }
}

#Preview {
    ExpensesView(filter: .personal, sortOrder: [SortDescriptor(\.id)])
}
