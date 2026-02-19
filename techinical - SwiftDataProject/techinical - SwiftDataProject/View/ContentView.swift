//
//  ContentView.swift
//  techinical - SwiftDataProject
//
//  Created by Stoyan Hristov on 18.02.26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate),
    ]

    @State private var showingUpcomingOnly = false

    var body: some View {
        NavigationStack {
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Samples", systemImage: "plus") {
                            let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                            let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                            let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                            let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

                            modelContext.insert(first)
                            modelContext.insert(second)
                            modelContext.insert(third)
                            modelContext.insert(fourth)
                        }
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                            showingUpcomingOnly.toggle()
                        }
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        Menu("Sort", systemImage: "arrow.up.arrow.down") {
                            Picker("Sort", selection: $sortOrder) {
                                Text("Sort by Name")
                                    .tag([
                                        SortDescriptor(\User.name),
                                        SortDescriptor(\User.joinDate),
                                    ])

                                Text("Sort by Join Date")
                                    .tag([
                                        SortDescriptor(\User.joinDate),
                                        SortDescriptor(\User.name),
                                    ])
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
