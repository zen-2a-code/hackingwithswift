//
//  ExpenseRowView.swift
//  iExpense
//
//  Created by Stoyan Hristov on 20.01.26.
//

import SwiftUI

struct ExpenseRowView: View {
    let item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(Font.headline)
                Text(item.expenseType.title)
            }
            Spacer()
            
            Text(item.amount, format: .currency(code: "currencyCode"))
                .foregroundStyle(foregroundStyle(for: item.expenseCategory))
                .fontWeight(item.expenseCategory == .expensive ? .bold : .regular)
        }
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
        ExpenseRowView(item: ExpenseItem(id: UUID(uuidString: "B22B9AEC-7ED7-4F9E-847D-951649111821")!, name: "Weed", type: .personal, amount: 20))
    }
