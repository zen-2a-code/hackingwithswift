//
//  ContentView.swift
//  HighRollers
//
//  Created by Stoyan Hristov on 13.04.26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var viewModel: ViewModel
    
    init(modelContext: ModelContext) {
        _viewModel = State(initialValue: ViewModel(modelContext: modelContext))
    }
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    let container = try! ModelContainer(
        for: Roll.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    ContentView(modelContext: container.mainContext)
        .modelContainer(container)
}
