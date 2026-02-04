//
//  ContentView.swift
//  Habbit Tracker
//
//  Created by Stoyan Hristov on 3.02.26.
//

import SwiftUI

struct ContentView: View {
    @State var habbits = Habbits()
    @State private var showAddHabbitSheet: Bool = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(habbits.habbits) { habbit in
                    NavigationLink(value: habbit) {
                        HStack(spacing: 30) {
                            Text("\(habbit.title)")
                            Spacer()
                            Text("\(habbit.completionCount)")
                        }
                    }
                }
                .onDelete { indexSet in
                    habbits.deleteHabbit(indexSet)
                }
            }
            .sheet(isPresented: $showAddHabbitSheet) {
                NavigationStack {
                    AddNewHabbitView(habbits: habbits)
                }
                .presentationDetents([.fraction(0.7), .large])
            }
            .navigationDestination(for: Habbit.self) { currentHabbit in
                HabbitDetailsView(habbit: currentHabbit, habbits: habbits)
            }
            .toolbar {
                Button("Add habbit", systemImage: "plus") {
                    showAddHabbitSheet = true
                }
            }
            .navigationTitle("Habbit tracker")
        }
    }
}

#Preview {
    ContentView()
}
