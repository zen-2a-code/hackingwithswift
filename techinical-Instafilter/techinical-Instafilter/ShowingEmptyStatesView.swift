//
//  ShowingEmptyStates.swift
//  techinical-Instafilter
//
//  Created by Stoyan Hristov on 28.02.26.
//

import SwiftUI

struct ShowingEmptyStatesView: View {
    var body: some View {
//        ContentUnavailableView("No snippets", systemImage: "swift")
//        ContentUnavailableView("No snippets", systemImage: "swift", description: Text("You don't have any saved snippets yet."))
        
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                // create a snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ShowingEmptyStatesView()
}
