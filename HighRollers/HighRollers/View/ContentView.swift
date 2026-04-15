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
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.purple, .pink]), startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
            
            }
        }
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
