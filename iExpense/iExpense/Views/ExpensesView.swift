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
            ForEach(allExpenses.items) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(Font.headline)
                        Text(item.type.title)
                    }
                    Spacer()

                    Text(item.amount, format: .currency(code: "currencyCode"))
                        .foregroundStyle(foregroundStyle(for: item.expenseCategory))
                        .fontWeight(item.expenseCategory == .expensive ? .bold : .regular)
                }
            }
            .onDelete(perform: deleteItems)
        }
    }

    func deleteItems(at offsets: IndexSet) {
        allExpenses.items.remove(atOffsets: offsets)
    }

    func foregroundStyle(for category: ExpenseCategory) -> Color {
        switch category {
        case .cheap:
            .green
        case .average:
            .orange
        case .expensive:
            .red
        }
    }
}

#Preview {
    ExpensesView(allExpenses: Expenses())
}
