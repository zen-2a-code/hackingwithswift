//
//  SimpleTabView.swift
//  technical-HotProspects
//
//  Created by Stoyan Hristov on 22.03.26.
//

import SwiftUI

struct SimpleTabView: View {
    var body: some View {
        TabView{
            Text("Tab one")
                .tabItem {
                    Label("One", systemImage: "star")
                }
            Text("Tab two")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
        }
    }
}

#Preview {
    SimpleTabView()
}
