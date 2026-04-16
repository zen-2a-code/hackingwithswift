//
//  PullingASheetWithOptionalView.swift
//  techinical-SnowSeeker
//
//  Created by Stoyan Hristov on 16.04.26.
//

import SwiftUI

private struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ChangingSheetSizeView: View {
    @State private var selectedUser: User? = nil
    
    var body: some View {
        Button("Tap Me") {
            selectedUser = User()
        }
        .sheet(item: $selectedUser) { uwnrappedUser in
            Text(uwnrappedUser.id)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    ChangingSheetSizeView()
}
