//
//  ContentView.swift
//  Navigation
//
//  Created by Stoyan Hristov on 26.01.26.
//

//
//  ContentView.swift
//  Navigation
//
//  Created by Stoyan Hristov on 26.01.26.
//

import SwiftUI

struct ContentView: View {

    @State private var selected: [Int] = []
    var body: some View {
        NavigationStack(path: $selected) {
            List(1..<51) { number in
                NavigationLink("Row \(number)", value: number)
            }
            .navigationDestination(for: Int.self) {selectedNumber in
                Image(systemName: "\(selectedNumber).circle")
                
                List(1..<51) { number in
                    NavigationLink("Row \(number)", value: number)
                }
                .toolbar {
                    Button("Home", role: .destructive) {
                        selected.removeAll(keepingCapacity: false)
                    }
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
