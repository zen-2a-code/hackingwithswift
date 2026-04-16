//
//  PullingAlertWithOptinal.swift
//  techinical-SnowSeeker
//
//  Created by Stoyan Hristov on 16.04.26.
//

import SwiftUI

private struct User: Identifiable {
    var id = "Taylor Swift"
}

struct PullingAlertWithOptinal: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    var body: some View {
        Button("Tap Me") {
            selectedUser = User()
            isShowingUser = true
        }
        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { unwrappedUser in
            Button(unwrappedUser.id) { }
        }
    }
}

#Preview {
    PullingAlertWithOptinal()
}
