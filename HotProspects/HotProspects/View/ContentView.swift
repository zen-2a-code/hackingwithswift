//
//  ContentView.swift
//  HotProspects
//
//  Created by Stoyan Hristov on 25.03.26.
//

import SwiftData
import SwiftUI

enum SortBy: String, CaseIterable {
    case name, recent
}

struct ContentView: View {
    @State private var sortedBy = SortBy.name
    
    var body: some View {
        TabView {
            ProspectsView(filter: .none, sortedBy: $sortedBy)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }

            ProspectsView(filter: .contacted, sortedBy: $sortedBy)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectsView(filter: .uncontacted, sortedBy: $sortedBy)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Prospect.self, inMemory: true)
}
