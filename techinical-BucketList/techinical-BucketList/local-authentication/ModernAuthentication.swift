//
//  ModernAuthentication.swift
//  techinical-BucketList
//
//  Created by Stoyan Hristov on 12.03.26.
//

import LocalAuthentication
import SwiftUI

struct ModernAuthentication: View {
    @State private var isUnlocked = false
    @State private var authErrorMessage = ""

    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .task {
            await authenticate()
        }
    }

    /// Requests authentication using Face ID / Touch ID with device passcode fallback.
    @MainActor
    private func authenticate() async {
        let context = LAContext()
        let reason = "Unlock your protected data."

        var error: NSError?
        guard context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) else {
            authErrorMessage = error?.localizedDescription ?? "Authentication is not available."
            return
        }

        do {
            let success = try await context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason)
            isUnlocked = success
        } catch {
            authErrorMessage = error.localizedDescription
        }
    }
}

#Preview {
    ModernAuthentication()
}
