//
//  ContentView.swift
//  Moonshot
//
//  Created by Stoyan Hristov on 21.01.26.
//

import SwiftUI

struct ContentView: View {
    private let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    private let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showListView = false
    

    var body: some View {
        NavigationStack {
            ScrollView {
                HStack() {
                    Spacer()
                    Toggle("List view", isOn: $showListView)
                        .fixedSize()
                        .tint(.blue.opacity(0.4))
                }
                .padding()
                
                if showListView {
                  MissionsListView(missions: missions, astronauts: astronauts)
                } else {
                    MissionsGridView(missions: missions, astronauts: astronauts)
                }
                
            }
            .preferredColorScheme(.dark)
            .background(.darkBackground)
            .navigationTitle("Moonshot")
        }
    }
}

#Preview {
    ContentView()
}
