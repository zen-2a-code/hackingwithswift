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
                        Text(item.type)
                    }
                    Spacer()

                    Text(item.amount, format: .currency(code: "currencyCode"))
                }
            }
            .onDelete(perform: deleteItems)
        }
    }

    func deleteItems(at offsets: IndexSet) {
        allExpenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ExpensesView(allExpenses: Expenses())
}
