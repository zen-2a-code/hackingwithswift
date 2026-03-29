//
//  SimpleTabView.swift
//  technical-HotProspects
//
//  Created by Stoyan Hristov on 22.03.26.
//

import SwiftUI

struct ControledProgrammaticallyTabView: View {
    @State private var selectedTab = "one"
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack(spacing: 10) {
                Text("Tab One")
                Button("Go to Tab two") {
                    selectedTab = "two"
                }
            }
            .tabItem {
                Label("One", systemImage: "star")
            }
            .tag("one")
            Text("Tab Two")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("two")
        }
    }
}

#Preview {
    ControledProgrammaticallyTabView()
}
