//
//  PullingASheetWithOptionalView.swift
//  techinical-SnowSeeker
//
//  Created by Stoyan Hristov on 16.04.26.
//

import SwiftUI

private struct User: Identifiable, Equatable {
    var id = "Taylor Swift"
}

struct PullingASheetWithOptionalView: View {
    @State private var selectedUser: User? = nil
    
    var body: some View {
        Button("Tap Me") {
            selectedUser = User()
        }
        .sheet(item: $selectedUser) { uwnrappedUser in
            Text(uwnrappedUser.id)
        }
        .onChange(of: selectedUser) { oldValue, newValue in
            // when there is value in the selectedUser the sheet pops up, when the sheet is dismiss selectedUser returns to nil
            print("Old value: \(String(describing: oldValue)) |  New value:\(String(describing: newValue))")
        }
    }
}

#Preview {
    PullingASheetWithOptionalView()
}
