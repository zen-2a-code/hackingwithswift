//
//  SimpleTabView.swift
//  technical-HotProspects
//
//  Created by Stoyan Hristov on 22.03.26.
//

import SwiftUI

struct EnhancedControledProgrammaticallyTabView: View {
    @State private var selectedTab = ScreenTab.tabOne
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack(spacing: 10) {
                Text("Tab One")
                Button("Go to Tab two") {
                    selectedTab = .tabTwo
                }
            }
            .tabItem {
                Label("One", systemImage: "star")
            }
            .tag(ScreenTab.tabOne)
            Text("Tab Two")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag(ScreenTab.tabTwo)
        }
    }
    
    enum ScreenTab {
        case tabOne, tabTwo
    }
}

#Preview {
    EnhancedControledProgrammaticallyTabView()
}
