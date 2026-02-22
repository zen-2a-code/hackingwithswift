//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Stoyan Hristov on 18.01.26.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
